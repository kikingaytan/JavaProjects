package org.kitchen.services;

import java.util.Set;

import org.kitchen.commands.RecipeCommand;
import org.kitchen.domain.Recipe;


public interface RecipeService {

    Set<Recipe> getRecipes();

    Recipe findById(Long l);

    RecipeCommand findCommandById(Long l);

    RecipeCommand saveRecipeCommand(RecipeCommand command);

    void deleteById(Long idToDelete);
}
