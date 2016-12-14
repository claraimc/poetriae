<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <pattern>
        <rule context="tei:term">
            <report test="@n = ../following-sibling::*/tei:term/@n">Este número está repetido!</report>
        </rule>
    </pattern>
</schema>
