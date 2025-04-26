(class_declaration
    (access_modifier)? @context
    (modifier)* @context
    "class" @context
    (unqualified_type) @name
    ; TODO: should we include what this interface extends?
) @item

(constructor_declaration
    (modifier)* @context
    "construct" @context
) @item

(destructor_declaration
    (modifier)* @context
    "~" @name
    (identifier) @name
    "(" @context
    ")" @context
) @item

(property_declaration
    (access_modifier)? @context
    (modifier)* @context
    (type) @context
    (symbol) @name
    "{" @context
    (property_accessor
        (access_modifier)? @context
        (property_accessor_type) @context
        ";"? @context
        (block
            "{" @context
            "}" @context
        )?
    )+
    "}" @context
    ; TODO: decide what should be shown in the outline
    ; currently it's: `public int some_int { get; set; }` or `public int some_int { get { } set { } }` for properties
    ; and `int some_int ;` for fields
) @item

(field_declaration
    (access_modifier)? @context
    (modifier)* @context
    (type) @context
    (identifier) @name
    ";" @context
) @item

(enum_declaration
    (access_modifier)? @context
    (modifier)* @context
    "enum" @context
    (symbol) @name
) @item

(namespace_declaration
    "namespace" @context
    (symbol) @name
) @item

(constant_declaration
    (access_modifier)? @context
    (modifier)* @context
    "const" @context
    (type) @context
    (identifier) @name
) @item

(method_declaration
    (access_modifier)? @context
    (modifier)* @context
    (type) @context
    (symbol) @name
    (type_arguments)? @context
    "(" @context
    (
        (parameter)
        ("," @context (parameter) @context)*
    )? @context
    .
    ")" @context
    ; TODO: should we include throws and ensures into the outline?
) @item

(creation_method_declaration
    (access_modifier)? @context
    (modifier)* @context
    (symbol) @name
    "(" @context
    (
        (parameter)
        ("," @context (parameter) @context)*
    )? @context
    .
    ")" @context
    ; TODO: should we include throws and ensures into the outline?
) @item

(interface_declaration
    (access_modifier)? @context
    (modifier)* @context
    "interface" @context
    (unqualified_type) @name
    ; TODO: should we include what this interface extends?
) @item

(struct_declaration
    (access_modifier)? @context
    (modifier)* @context
    "struct" @context
    (unqualified_type) @name
) @item

(errordomain_declaration
    (access_modifier)? @context
    (modifier)* @context
    "errordomain" @context
    (symbol) @name
) @item

(delegate_declaration
    (access_modifier)? @context
    (modifier)* @context
    "delegate" @context
    (type) @context
    (symbol) @name
    (type_arguments)? @context
    "(" @context
    (
        (parameter)
        ("," @context (parameter) @context)*
    )? @context
    .
    ")" @context
    ; TODO: should we include throws into the outline
) @item

(signal_declaration
    (access_modifier)? @context
    (modifier)* @context
    "signal" @context
    (type) @context
    (symbol) @name
    "(" @context
    (
        (parameter)
        ("," @context (parameter) @context)*
    )? @context
    .
    ")" @context
) @item
