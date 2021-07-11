#pragma once
#include "app/rapidjson/document.h"
#include <iostream>
#include <fstream>
#include <vector>
#include <map>
#include <memory>

#ifndef Kharsair_APP_H
#define Kharsair_APP_H

namespace kharsair::APP
{
    
    class AgentPlanningProgram
    {

    public:
        explicit AgentPlanningProgram(std::string fileName, bool& construct_app_success);
        ~AgentPlanningProgram();

    private:

        struct vStr2d
        {
            std::string key;
            std::string value;
        };

        struct Predicate
        {
            std::string predicate_name;
            std::vector<vStr2d> parameters;
        };

        struct APP_State;

        struct APP_Transition
        {
            std::string transition_name;
            APP_State* start_state = nullptr;
            APP_State* end_state = nullptr;

            std::vector<Predicate> guards;
            std::vector<Predicate> maintenance_goals;
            std::vector<Predicate> achievement_goals;
        };

        struct APP_State
        {
            std::string state_name;
            std::vector<APP_Transition*> available_transition; //transition struct that use this state as the origin
        };


        APP_State* m_current_state_ptr = nullptr;

        std::map<std::string, APP_State*> m_states;

        std::vector<APP_Transition*> m_transitions;

    public:

        friend std::ostream& operator<<(std::ostream& os, Predicate& predicate);

        friend std::ostream& operator<<(std::ostream& os, const AgentPlanningProgram& app);

        friend std::ostream& operator<<(std::ostream& os, APP_Transition& transition);


        static void help_populate_predicates(std::vector<Predicate> &predicate_list, rapidjson::Value &predicate_values);

        bool parse_from_file(std::string& fileName);

        void set_current_state(const std::string& state_name);

        APP_State* get_current_state();


    };
}

#endif

