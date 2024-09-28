/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.self.care.entities;

/**
 *
 * @author kavit
 */
public class Routine {
    private int routine_id;
    private String routine_text;
    private int user_id;

    public int getRoutine_id() {
        return routine_id;
    }

    public void setRoutine_id(int routine_id) {
        this.routine_id = routine_id;
    }

    public String getRoutine_text() {
        return routine_text;
    }

    public void setRoutine_text(String routine_text) {
        this.routine_text = routine_text;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Routine(String routine_text, int routine_id) {
        this.routine_id = routine_id;
        this.routine_text = routine_text;
    }
    
    
}
