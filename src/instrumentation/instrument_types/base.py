#!/usr/bin/env python3
"""
Base instrumentation type definitions
"""

from typing import Set, Protocol
from abc import ABC, abstractmethod


class InstrumentationType(ABC):
    """
    Base class for all instrumentation types
    
    This abstract base class defines the interface that all instrumentation
    types must implement.
    """
    
    @property
    @abstractmethod
    def name(self) -> str:
        """Return the human-readable name of this instrumentation type"""
        pass
    
    @property 
    @abstractmethod
    def api_functions(self) -> Set[str]:
        """Return the set of API function names to instrument"""
        pass
    
    @property
    @abstractmethod
    def template(self) -> str:
        """Return the instrumentation template for this type"""
        pass
    
    @property
    @abstractmethod
    def required_headers(self) -> list[str]:
        """Return list of headers required for this instrumentation type"""
        pass
    
    @property
    @abstractmethod
    def marker_prefix(self) -> str:
        """Return the log marker prefix for this instrumentation type"""
        pass
