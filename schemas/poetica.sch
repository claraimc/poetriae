<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <let name="terminos" value="doc('../auxiliar/vocabulario.xml')//tei:term/@n"/>
    <let name="personas" value="doc('../auxiliar/referencias.xml')//tei:person/concat('#', @xml:id)"/>
    <pattern>
        <rule context="tei:rs">
            <assert test="tokenize(@key, '\s+') = $terminos">Este término no está registrado</assert>
            <assert test="if (@type) then @type = ('aim', 'typology', 'definition', 'origin') else true()">Los valores posibles de @type son “aim”, “typology”, “content” y “origin”</assert>
        </rule>
        <rule context="tei:name[ancestor::tei:text]">
            <assert test="@corresp = $personas">Esta referencia no está registrada</assert>
        </rule>
    </pattern>
</schema>
