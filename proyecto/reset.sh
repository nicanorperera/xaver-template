#!/bin/bash
rake cargar:reset
rake cargar:todo
passenger start
