package org.kitchen.services;

import java.util.Set;

import org.kitchen.commands.UnitOfMeasureCommand;

public interface UnitOfMeasureService {

    Set<UnitOfMeasureCommand> listAllUoms();
}
