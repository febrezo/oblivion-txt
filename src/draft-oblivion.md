---
title: A Method for Privacy Security Policies
abbrev: I-D
docname: draft-brezorubio-wg-oblivion-00
date: 2018-11-22
category: info
ipr: trust200902

author:
 -
    ins: F. Brezo
    name: Felix Brezo
    organization: Telefonica
    email: felix.brezofernandez@telefonica.com

 -
    ins: Y. Rubio
    name: Yaiza Rubio
    organization: Telefonica
    email: yaiza.rubiovinuela@telefonica.com


normative:
  RFC2119:
  RFC5785:
  RFC1945:
  RFC2046:
  RFC7231:
  RFC8126:
  RFC5785:
  RFC6890:
  RFC2606:
  RFC2142:
  RFC3986:
  RFC2046:
  RFC3629:
  RFC5198:
  RFC5234:
  RFC5322:

informative:


--- abstract

The current method for opting out from a service are far from being standard.
This fact makes the process of deactivating or deleting an account from a
website difficult to find since each platform provides the link in a different
way.
This document defines a standard ("oblivion.txt") to help organizations to
describe the steps to follow by a user for deactivating or deleting an account
from their websites in a secure and standard way.

--- middle

# Introduction

## Motivation and Previous Work

Many of the standard interaction of end users with online services involve creating and managing personal accounts.
Even when the creation of these accounts may seem easy to control, the experience on the deletion and deactivation of an account does not fulfill with any type of standards.

Regarding this issue, there has been efforts to list the procedures followed by different platforms to conduct this task.
For example, the project JustDelete.me shows a list of direct links to the deletion URLs on different platforms.
However, this process is mainly curated by contributors, which is an approach that does not scale well.

In this document, we define a machine-readable and extensible way of communicating how users can interact with a service to deactivate their accounts or fully deleting them.
This standard is thought to assist companies on providing a transparent and reachable way of giving access to their opt-out procedures so as to give back to the users the right to keep control of their own digital footprint.

## Terminology

In this document, the key words "MUST", "MUST NOT", "REQUIRED",
"SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY",
and "OPTIONAL" are to be interpreted as described in BCP 14, RFC 2119
{{RFC2119}}.

# The Specification

This standard defines a text file to be placed in a known location that provides information for users and applications to assist them in the process of finding the tools to delete or remove accounts and services.

The file is named "oblivion.txt", and this file SHOULD be placed
under the /.well-known/ path ("/.well-known/oblivion.txt") {{RFC5785}}
of a domain name or IP address for web properties.
If it is not possible to place the security.txt file in the /.well-known/ path or setup a redirect, web-based services MAY place the file in the top-level path of a given web domain or IP address ("/oblivion.txt") as a fall back option.
For web-based services, the instructions MUST be accessible via the Hypertext Transfer Protocol {{RFC1945}} as a resource of Internet Media Type "text/plain" with the default charset parameter set to "utf-8" per section 4.1.3 of {{RFC2046}}.
For file systems and version control repositories a ".oblivion.txt" file SHOULD be placed in the root directory of a particular file system or source code project.

This text file contains multiple directives with different values.
The "directive" is the first part of a field all the way up to the
colon ("Contact:").
Directives MUST be case-insensitive.
The "value" comes after the directive ("https://example.com/oblivion").
A "field" MUST alway consist of a directive and a value ("Contact: https://example.com/oblivion").
An "oblivion.txt" file can have an unlimited number of fields.
It is important to note that you MUST have a separate line for every field.  One MUST NOT chain multiple values for a single directive and everything MUST be in a separate field.
Unless otherwise indicated in a definition of a particular field, any directive MAY appear multiple times.

## Scope

An oblivion.txt file MUST apply to the domain in the URI used to retrieve it and to any of its subdomains or parent domains.
However, an oblivion.txt file that is found in a file system or version control repository MUST only apply to the folder or repository in which it is located, and not to any of its parent or sibling folders, or repositories.

Some examples appear below:

# The following only applies to example.com and subdomain.example.com
https://example.com/.well-known/oblivion.txt

# This only applies to subdomain.example.com but not to example.com
https://subdomain.example.com/.well-known/oblivion.txt

# This oblivion.txt file applies to IPv4 address of 192.0.2.0.
http://192.0.2.0/.well-known/oblivion.txt

# This oblivion.txt file applies to IPv6 address of 2001:db8:8:4::2.
http://[2001:db8:8:4::2]/.well-known/security.txt

# This oblivion.txt file applies to the /example/folder1 directory.
/example/folder1/oblivion.txt

## Comments

Any line beginning with the "#" (%x30) symbol MUST be interpreted as
a comment.

Example:

# This is a comment.

You MAY use one or more comments as descriptive text immediately before the field.
Parsers SHOULD associate the comments with the respective field.

## Separate Fields

A separate line is REQUIRED for every new value and field.
You MUST NOT chain everything into a single field.
Every line MUST end either with a carriage return and line feed characters (CRLF / %x0D %x0A) or just a line feed character (LF / %x0A).

## Field Definitions

### Contact

This directive allows you to provide an address where users CAN ask for additional information to delete their accounts.
The value MAY be an email address, a phone number and/or a contact page with more information.
The "Contact:" directive MUST always be present in an oblivion.txt file.
If this directive indicates a web URL, then it MUST be begin with "https://".
Contact email addresses SHOULD use the conventions defined in section 4 of {{RFC2142}}, but there is no requirement for this directive to be an email address.

The value MUST follow the general syntax described in {{RFC3986}}.
This means that "mailto" and "tel" URI schemes MUST be used when specifying email addresses and telephone numbers.

The precedence SHOULD be in listed order.
The first field is the preferred method of contact.
In the example below, the e-mail address is the preferred method of contact.

Contact: mailto:oblivion@example.com
Contact: tel:+1-201-555-0123
Contact: https://example.com/oblivion-contact.html

### Deactivate

The "Deactivate" directive is used for linking to the deactivation procedure.
If this directive indicates a web URL, then it SHOULD begin with "https://".

Hiring: https://example.com/deactivate-account.html

### Delete

The "Delete" directive is used for linking to the deletion procedure.
If this directive indicates a web URL, then it SHOULD begin with "https://".

Hiring: https://example.com/delete-account.html

## Encryption

This directive allows you to point to an encryption key that any user or application SHOULD use for encrypted communication.
You MUST NOT directly add your key to the field, instead the value of this field MUST be a URI pointing to a location where the key can be retrieved
from.
If this directive indicates a web URL, then it MUST be begin
with "https://".

When it comes to verifying the authenticity of the key, it is always the user's responsibility to make sure the key being specified is indeed one they trust.
Users MUST NOT assume that this key is used to generate the signature file referenced in Section 3.4.7.

Example of a PGP key available from a web server:

Encryption: https://example.com/pgp-key.txt

Example of a PGP key available from an OPENPGPKEY DNS:

Encryption: dns:5d2d37ab76d47d36._openpgpkey.example.com?type=OPENPGPKEY

Example of a PGP key being referenced by its fingerprint:

Encryption: openpgp4fpr:5f2de5521c63a801ab59ccb603d49de44b29100f

### Policy

This directive allows you to link to where your privacy policy and/or  terms and conditions policy is located.
This can help end users to understand what are the conditions to opt-out in the service.
If this directive indicates a web URL, then it SHOULD begin with "https://".

Example:

Policy: https://example.com/privacy-policy.html

### Signature

This directive allows you to specify a full URI (as per {{RFC3986}}) of an external signature file that can be used to check the authenticity of a "oblivion.txt" file.
External signature files SHOULD be named "oblivion.txt.sig" and SHOULD be placed under the "/.well-known/" path ("/.well-known/oblivion.txt.sig").
If this directive indicates a web URL, then it MUST be begin with "https://".
This directive MUST NOT appear more than once.

It is RECOMMENDED to implementors that this directive be always used.

When it comes to verifying the authenticity of the file, it is always the user's responsibility to make sure the key being specified is indeed one they trust.

Here is an example of an external signature file.

Signature: https://example.com/.well-known/oblivion.txt.sig

## Example of an oblivion.txt file

# Our oblivion address
Contact: mailto:oblivion@example.com

# Our PGP key
Encryption: https://example.com/pgp-key.txt

# Our privacy policy
Policy: https://example.com/privacy-policy.html

# Deactivate from our service
Deactivate: https://example.com/deactivate-account.html

# Delete your account from our service
Delete: https://example.com/delete-account.html

# Verify this security.txt file
Signature: https://example.com/.well-known/oblivion.txt.sig

# Location of the oblivion.txt file

```
External
+----------------------------------------------------------------+
|              Default                                           |
|  +-----------------------------+          +-----------------+  |
|  |                             | Redirect |                 |  |
|  |  /.well-known/oblivion.txt  <----------+  /oblivion.txt  |  |
|  |                             |          |                 |  |
|  +-----------------------------+          +-----------------+  |
|                                                                |
+----------------------------------------------------------------+

Internal
+------------------------+
|                        |
|  +------------------+  |
|  |                  |  |
|  |  /.oblivion.txt  |  |
|  |                  |  |
|  +------------------+  |
|                        |
+------------------------+
```

## Web-based services

Web-based services SHOULD place the oblivion.txt file under the "/.well-known/" path; e. g. "https://example.com/.well-known/oblivion.txt".
An oblivion.txt file located under the top-level path SHOULD either redirect (as per section 6.4 of {{RFC7231}}) to the oblivion.txt file under the "/.well-known/"" path or be used as a fall back.


## Filesystems

File systems SHOULD place the oblivion.txt file under the root
directory; e. g., "/.oblivion.txt", "C:\\.oblivion.txt".

user:/$ l
.oblivion.txt
example-directory-1/
example-directory-2/
example-directory-3/
example-file


## Internal hosts

A .oblivion.txt file SHOULD be placed in the root directory of an
internal host.

## Extensibility

Like many other formats and protocols, this format may need to be extended over time to fit the ever-changing landscape of the Internet.
Therefore, extensibility is provided via an IANA registry for directives as defined in Section 7.2.
Any directives registered via that process MUST be considered optional.
To encourage extensibility and interoperability, implementors MUST ignore any fields they do not explicitly support.


# File Format Description and ABNF Grammar

The expected file format of the oblivion.txt file is plain text (MIME type "text/plain") as defined in section 4.1.3 of {{RFC2046}} and is encoded using UTF-8 {{RFC3629}} in Net-Unicode form {{RFC5198}}.

The following is an ABNF definition of the oblivion.txt format, using the conventions defined in {{RFC5234}} and {{RFC5322}}.

body                   = *line (permission-field eol) (signature-field eol) *line

line                   = *1(field / comment) eol

eol                    = *WSP [CR] LF

field                  = acknowledgments-field /
                         contact-field /
                         deactivate-field /
                         delete-field /
                         encryption-field /
                         policy-field /
                         ext-field

fs                     = ":"

comment                = "#" *(WSP / VCHAR / %xA0-E007F)

contact-field          = "Contact" fs SP (email / uri / phone)

email                  = <Email address as per {{RFC5322}}>

phone                  = "+" *1(DIGIT / "-" / "(" / ")" / SP)

uri                    = <URI as per {{RFC3986}}>

deactivate-field       = "Deactivate" fs SP uri

delete-field           = "Delete" fs SP uri

encryption-field       = "Encryption" fs SP uri

policy-field           = "Policy" fs SP uri

signature-field        = "Signature" fs SP uri

ext-field              = field-name fs SP unstructured

field-name             = <as per section 3.6.8 of {{RFC5322}}>

unstructured           = <as per section 3.2.5 of {{RFC5322}}>

   "ext-field" refers to extension fields, which are discussed in
   Section 4.4


# Security Considerations

Organizations creating oblivion.txt files will need to consider several security-related issues.
These include exposure to sensitive information and attacks where limited access to a server could grant the ability to modify the contents of the oblivion.txt file or affect how it is served.
Organizations SHOULD also monitor their oblivion.txt files regularly to detect tampering.
Organizations SHOULD also ensure that any resources such as web pages, email
addresses and telephone numbers references by an oblivion.txt file are kept current, are accessible and controlled by the organization, and are kept secure.

To ensure the authenticity of the oblivion.txt file, organizations SHOULD sign the file and include the signature using the "Signature" directive (Section 3.4.6).
As stated in Section 3.4.4 and Section 3.4.6, both encryption keys and external signature files MUST be loaded over HTTPS.

Websites SHOULD reserve the oblivion.txt namespace to ensure no
third-party can create a page with the "oblivion.txt" name.

# IANA Considerations

"example.com" is used in this document following the uses indicated in {{RFC2606}}.

"192.0.2.0" and "2001:db8:8:4::2" are used in this document following the uses indicated in {{RFC6890}}.

## Well-Known URIs registry

The "Well-Known URIs" registry should be updated with the following additional values (using the template from {{RFC5785}}):

URI suffix: oblivion.txt

URI suffix: oblivion.txt.sig

Change controller: IETF

Specification document(s): this document

## Registry for security.txt Header Fields

IANA is requested to create the "oblivion.txt Header Fields" registry in accordance with {{RFC8126}}.
This registry will contain header fields for use in oblivion.txt files, defined by this specification.

New registrations or updates MUST be published in accordance with the "Expert Review" guidelines as described in section 4.5 of {{RFC8126}}.
Any new field thus registered is considered optional by this specification unless a new version of this specification is published.

New registrations and updates MUST contain the following information:

1.  Name of the field being registered or updated
2.  Short description of the field
3.  Whether the field can appear more than once
4.  The document in which the specification of the field is published
5.  New or updated status, which MUST be one of: current: The field        is in current use deprecated: The field is in current use, but its use is discouraged historic: The field is no longer in current use

 An update may make a notation on an existing registration indicating that a registered field is historical or deprecated if appropriate.

The initial registry contains these values:

Field Name: Contact
Description: contact information to use for opt-out related issues
Multiple Appearances: Yes
Published in: this document
Status: current

Field Name: Deactivate
Description: link to the deactivation
Multiple Appearances: No
Published in: this document
Status: current

Field Name: Delete
Description: link to the deletion page
Multiple Appearances: No
Published in: this document
Status: current

Field Name: Encryption
Description: link to a key to be used for encrypted communications
Multiple Appearances: Yes
Published in: this document
Status: current

Field Name: Policy
Description: link to privacy policy page
Multiple Appearances: Yes
Published in: this document
Status: current

Field Name: Signature
Description: signature used to verify the authenticity of the file
Multiple Appearances: No
Published in: this document
Status: current

# Contributors

The authors would like to acknowledge the work started by E. Foudil, Y.
Shafranovich et al. in defining the structure and purpouse of the "security.txt" file as shown in the Internet Draft "A Method for Web Security Policies".
The structure of this document including several normartive and formal sections have been used as a referemce for the final structure of many of the normative parts in this document.
