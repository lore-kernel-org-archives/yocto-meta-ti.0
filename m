Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F4BC47073
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 22:23:28 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.7259.1704925407306490094
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jan 2024 14:23:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=Qx9FfquG;
 spf=pass (domain: criticallink.com, ip: 209.85.208.169, mailfrom: jcormier@criticallink.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cd61dd39d9so33023481fa.2
        for <meta-ti@lists.yoctoproject.org>; Wed, 10 Jan 2024 14:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1704925405; x=1705530205; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q/+380JLpm7VKkvnrbVEtTwrVDGtEwEiSALNrjmp9MA=;
        b=Qx9FfquGJ14DtUw+XIQqn5gS1jar0nUU4n3/FRjoSZP113jq02cFU6hFbsCNXn1drM
         Zs3SBdLjrI3RQcLe6cJaMsEpujQaZoEZIprTIq+6Twp0ziAN+vIBPJj4o0ob9chVmU15
         P7l6Hml36dgiwyl8QRlvuNB4yrdwEJZHp6e4nXmJgzfcQXLDnw5Mvc+b9vI2cBdLl1Ve
         oVafs9rxSFoG+VxiBDEELEk79XyCk8NZVH2mmsNySw4/TRw1jeqsxibyH/6l3HCKqrak
         4ZdJ4+rQzz7Zhe0P+0NJSZ4mnaShKh75Lsuw1tY+a8Jto2vTGsTZSX8yv+/oPZkvfwQd
         BIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704925405; x=1705530205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/+380JLpm7VKkvnrbVEtTwrVDGtEwEiSALNrjmp9MA=;
        b=eFtw/Kch8N0E9Z9dfvNdTeOa3Q05CgRrPMYM4fuYolDL6mAu5irggoqV7EReSIwodA
         6Qlyx81ECxswTlEsdM5/Y2vygeh/FeF6EiR+ypz6J73gJe9r4OYXv0WR9JT3G3TmmV3Z
         3QW5yfqwFbFe6GNGBsgGaixW4SH4xzsQI6z2FGXHIxutkidHrAyHQO0gkqw1UDD850Mq
         Hdr9wrcnnteNjyNg8QqW1XtezDDIw0jdYnPh4J6zRNpOgdOdfmpllNpJpTCWhmXhDJzz
         myVI9ZiKIL7e1lLYqwL69sUozrQFnnDh5g4CbxoqSjEA0atYKpTw7wdZqV0WjVqVxF+L
         6Liw==
X-Gm-Message-State: AOJu0YxlzO1n+4HazooSFTRAwPNNBjR0X6h6bXrOd7vVlaOHCZVwzyWQ
	2DUavVA1LfCWFZIkgTvvgCb7OQGnieemg0uWbPetSMDUPL69
X-Google-Smtp-Source: AGHT+IFO4EP1+oaQDEk2d/KWe16JWlPhR2guEVUDP2iDpqb7UeK5KOLDRDRiMGU441GXeCAbNc5LU6JlPO5eTEwNcxo=
X-Received: by 2002:a2e:2c06:0:b0:2cc:e37b:cbe2 with SMTP id
 s6-20020a2e2c06000000b002cce37bcbe2mr111951ljs.76.1704925404553; Wed, 10 Jan
 2024 14:23:24 -0800 (PST)
MIME-Version: 1.0
References: <6K9j.1704444591892894346.Xv85@lists.yoctoproject.org>
 <CADL8D3Z=C3PzbVcn4si6hLkCCHtk9iNTsSzi+_hb3KRv2hvTfA@mail.gmail.com> <18cf56aea90.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
In-Reply-To: <18cf56aea90.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Wed, 10 Jan 2024 17:23:13 -0500
Message-ID: <CADL8D3ZjxJ0vczcGt_2nuDaQ8qYJ0qM9wAV9LU08UBBDbzFVsg@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone] libgpiod-tools gpioinfo missing for beaglebone
To: Bremenpl <bremenpl@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000001b7804060e9ee171"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jan 2024 22:23:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17399

--0000000000001b7804060e9ee171
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Which device tree file is your device loading?

On Wed, Jan 10, 2024 at 5:07=E2=80=AFPM Bremenpl <bremenpl@gmail.com> wrote=
:

> Hi Jonathan,
> Thank you for the answer.
>
> Yes it seems the dts file changed a bit between Dunfell and Kirkstone and
> these labers are now not there.
>
>    1. Any idea why these were gotten rid of? As you mentioned they are
>    usefull.
>    2. Who should be contacted to potentially put them back in place in
>    the repo (in case these were removed by error)?
>
> Thanks.
>
>
> On January 10, 2024 22:52:44 Jon Cormier <jcormier@criticallink.com>
> wrote:
>
>>
>>
>> On Fri, Jan 5, 2024 at 3:49=E2=80=AFAM Lukasz Przenioslo <bremenpl@gmail=
.com>
>> wrote:
>>
>>> Hello,
>>> I have recently moved from Dunfell to Kirkstone for the beaglebone
>>> machine. Since then I have noticed that calling gpioinfo from
>>> libgpiod-tools does not show the gpio labels:
>>>
>>> ```
>>> root@beaglebone:~# gpioinfo
>>> gpiochip0 - 32 lines:
>>>         line   0:      unnamed       unused   input  active-high
>>>         line   1:      unnamed       unused   input  active-high
>>>         line   2:      unnamed       unused   input  active-high
>>>         line   3:      unnamed       unused   input  active-high
>>>         line   4:      unnamed       unused   input  active-high
>>>         line   5:      unnamed       unused   input  active-high
>>>         line   6:      unnamed       unused   input  active-high
>>>         line   7:      unnamed       unused   input  active-high
>>>         line   8:      unnamed       unused   input  active-high
>>>         line   9:      unnamed       unused   input  active-high
>>>         line  10:      unnamed       unused   input  active-high
>>>         line  11:      unnamed       unused   input  active-high
>>>         line  12:      unnamed       unused   input  active-high
>>>         line  13:      unnamed       unused   input  active-high
>>>         line  14:      unnamed       unused   input  active-high
>>>         line  15:      unnamed       unused   input  active-high
>>>         line  16:      unnamed       unused   input  active-high
>>>         line  17:      unnamed       unused   input  active-high
>>>         line  18:      unnamed       unused   input  active-high
>>>         line  19:      unnamed       unused   input  active-high
>>>         line  20:      unnamed       unused   input  active-high
>>>         line  21:      unnamed "beaglebone:green:usr0" output
>>> active-high [used]
>>>         line  22:      unnamed "beaglebone:green:usr1" output
>>> active-high [used]
>>>         line  23:      unnamed "beaglebone:green:usr2" output
>>> active-high [used]
>>>         line  24:      unnamed "beaglebone:green:usr3" output
>>> active-high [used]
>>>         line  25:      unnamed       unused   input  active-high
>>>         line  26:      unnamed       unused   input  active-high
>>>         line  27:      unnamed       unused   input  active-high
>>>         line  28:      unnamed       unused   input  active-high
>>>         line  29:      unnamed       unused   input  active-high
>>>         line  30:      unnamed       unused   input  active-high
>>>         line  31:      unnamed       unused   input  active-high
>>> gpiochip1 - 32 lines:
>>>         line   0:      unnamed       unused   input  active-high
>>>         line   1:      unnamed       unused   input  active-high
>>>         line   2:      unnamed       unused   input  active-high
>>>         line   3:      unnamed       unused   input  active-high
>>>         line   4:      unnamed       unused   input  active-high
>>>         line   5:      unnamed       unused   input  active-high
>>>         line   6:      unnamed       unused   input  active-high
>>>         line   7:      unnamed       unused   input  active-high
>>>         line   8:      unnamed       unused   input  active-high
>>>         line   9:      unnamed       unused   input  active-high
>>>         line  10:      unnamed       unused   input  active-high
>>>         line  11:      unnamed       unused   input  active-high
>>>         line  12:      unnamed       unused   input  active-high
>>>         line  13:      unnamed       unused   input  active-high
>>>         line  14:      unnamed       unused   input  active-high
>>>         line  15:      unnamed       unused   input  active-high
>>>         line  16:      unnamed       unused   input  active-high
>>>         line  17:      unnamed       unused   input  active-high
>>>         line  18:      unnamed       unused   input  active-high
>>>         line  19:      unnamed       unused   input  active-high
>>>         line  20:      unnamed       unused   input  active-high
>>>         line  21:      unnamed       unused   input  active-high
>>>         line  22:      unnamed       unused   input  active-high
>>>         line  23:      unnamed       unused   input  active-high
>>>         line  24:      unnamed       unused   input  active-high
>>>         line  25:      unnamed       unused   input  active-high
>>>         line  26:      unnamed       unused   input  active-high
>>>         line  27:      unnamed       unused   input  active-high
>>>         line  28:      unnamed       unused   input  active-high
>>>         line  29:      unnamed       unused   input  active-high
>>>         line  30:      unnamed       unused   input  active-high
>>>         line  31:      unnamed       unused   input  active-high
>>> gpiochip2 - 32 lines:
>>>         line   0:      unnamed       unused   input  active-high
>>>         line   1:      unnamed       unused   input  active-high
>>>         line   2:      unnamed       unused   input  active-high
>>>         line   3:      unnamed       unused   input  active-high
>>>         line   4:      unnamed       unused   input  active-high
>>>         line   5:      unnamed       unused   input  active-high
>>>         line   6:      unnamed       unused   input  active-high
>>>         line   7:      unnamed       unused   input  active-high
>>>         line   8:      unnamed       unused   input  active-high
>>>         line   9:      unnamed       unused   input  active-high
>>>         line  10:      unnamed       unused   input  active-high
>>>         line  11:      unnamed       unused   input  active-high
>>>         line  12:      unnamed       unused   input  active-high
>>>         line  13:      unnamed       unused   input  active-high
>>>         line  14:      unnamed       unused   input  active-high
>>>         line  15:      unnamed       unused   input  active-high
>>>         line  16:      unnamed       unused   input  active-high
>>>         line  17:      unnamed       unused   input  active-high
>>>         line  18:      unnamed       unused   input  active-high
>>>         line  19:      unnamed       unused   input  active-high
>>>         line  20:      unnamed       unused   input  active-high
>>>         line  21:      unnamed       unused   input  active-high
>>>         line  22:      unnamed       unused   input  active-high
>>>         line  23:      unnamed       unused   input  active-high
>>>         line  24:      unnamed       unused   input  active-high
>>>         line  25:      unnamed       unused   input  active-high
>>>         line  26:      unnamed       unused   input  active-high
>>>         line  27:      unnamed       unused   input  active-high
>>>         line  28:      unnamed       unused   input  active-high
>>>         line  29:      unnamed       unused   input  active-high
>>>         line  30:      unnamed       unused   input  active-high
>>>         line  31:      unnamed       unused   input  active-high
>>> gpiochip3 - 32 lines:
>>>         line   0:      unnamed       unused   input  active-high
>>>         line   1:      unnamed       unused   input  active-high
>>>         line   2:      unnamed       unused   input  active-high
>>>         line   3:      unnamed       unused   input  active-high
>>>         line   4:      unnamed       unused   input  active-high
>>>         line   5:      unnamed       unused   input  active-high
>>>         line   6:      unnamed         "cd"   input   active-low [used]
>>>         line   7:      unnamed       unused   input  active-high
>>>         line   8:      unnamed       unused   input  active-high
>>>         line   9:      unnamed       unused   input  active-high
>>>         line  10:      unnamed       unused   input  active-high
>>>         line  11:      unnamed       unused   input  active-high
>>>         line  12:      unnamed       unused   input  active-high
>>>         line  13:      unnamed       unused   input  active-high
>>>         line  14:      unnamed       unused   input  active-high
>>>         line  15:      unnamed       unused   input  active-high
>>>         line  16:      unnamed       unused   input  active-high
>>>         line  17:      unnamed       unused   input  active-high
>>>         line  18:      unnamed       unused   input  active-high
>>>         line  19:      unnamed       unused   input  active-high
>>>         line  20:      unnamed       unused   input  active-high
>>>         line  21:      unnamed       unused   input  active-high
>>>         line  22:      unnamed       unused   input  active-high
>>>         line  23:      unnamed       unused   input  active-high
>>>         line  24:      unnamed       unused   input  active-high
>>>         line  25:      unnamed       unused   input  active-high
>>>         line  26:      unnamed       unused   input  active-high
>>>         line  27:      unnamed       unused   input  active-high
>>>         line  28:      unnamed       unused   input  active-high
>>>         line  29:      unnamed       unused   input  active-high
>>>         line  30:      unnamed       unused   input  active-high
>>>         line  31:      unnamed       unused   input  active-high
>>> ```
>>>
>>> 1. What could be the cause for that (exact different between Dunfell an=
d
>>> Kirkstone in meta-ti)? Can it be that the relevant dts file(s) somehow
>>> changed?
>>>
>> The gpio names are defined in the device tree by defining
>> "gpio-line-names =3D ..."
>> Example for the am335x-boneblack.dts from TIs 6.1 kernel.
>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm/bo=
ot/dts/am335x-boneblack.dts?h=3Dti-linux-6.1.y#n29
>>
>>> 2. Aside from labels missing, can there be any other consequences here?
>>> I tested gpio outputs state changing and it works normally.
>>>
>> I'd guess no, other than it being harder to identify the correct gpio.
>>
>>>
>>> I would appreciate all help and feedback!
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#17384):
>>> https://lists.yoctoproject.org/g/meta-ti/message/17384
>>> Mute This Topic: https://lists.yoctoproject.org/mt/103539668/7902621
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
>>> jcormier@criticallink.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>
>>
>> --
>> Jonathan Cormier
>> Software Engineer
>>
>> Voice:  315.425.4045 x222
>>
>>
>>
>> http://www.CriticalLink.com <http://www.criticallink.com/>
>> 6712 Brooklawn Parkway, Syracuse, NY 13211
>>
>> <https://www.linkedin.com/company/critical-link-llc>
>> <https://twitter.com/Critical_Link>
>>
>
>

--=20
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211

<https://www.linkedin.com/company/critical-link-llc>
<https://twitter.com/Critical_Link>

--0000000000001b7804060e9ee171
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+V2hpY2ggZGV2aWNlIHRyZWUgZmlsZSBpcyB5b3VyIGRldmljZSBsb2Fk
aW5nPzxicj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIi
IGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBXZWQsIEphbiAxMCwgMjAyNCBhdCA1OjA34oCvUE0gQnJl
bWVucGwgJmx0OzxhIGhyZWY9Im1haWx0bzpicmVtZW5wbEBnbWFpbC5jb20iPmJyZW1lbnBsQGdt
YWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxf
cXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNv
bGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PHU+PC91Pg0KDQo8ZGl2IHN0
eWxlPSJmb250LWZhbWlseTpBcmlhbCxNeXJpYWQsJnF1b3Q7TGliZXJhdGlvbiBTYW5zJnF1b3Q7
LHNhbnMtc2VyaWYiPg0KPGRpdiBkaXI9ImF1dG8iPg0KPGRpdiBkaXI9ImF1dG8iPkhpIEpvbmF0
aGFuLDwvZGl2PjxkaXYgZGlyPSJhdXRvIj5UaGFuayB5b3UgZm9yIHRoZSBhbnN3ZXIuPC9kaXY+
PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+WWVzIGl0IHNlZW1zIHRo
ZSBkdHMgZmlsZSBjaGFuZ2VkIGEgYml0IGJldHdlZW4gRHVuZmVsbCBhbmQgS2lya3N0b25lIGFu
ZCB0aGVzZSBsYWJlcnMgYXJlIG5vdyBub3QgdGhlcmUuwqA8L2Rpdj48ZGl2IGRpcj0iYXV0byI+
PG9sPjxsaT5BbnkgaWRlYSB3aHkgdGhlc2Ugd2VyZSBnb3R0ZW4gcmlkIG9mPyBBcyB5b3UgbWVu
dGlvbmVkIHRoZXkgYXJlIHVzZWZ1bGwuPC9saT48bGk+V2hvIHNob3VsZCBiZSBjb250YWN0ZWQg
dG8gcG90ZW50aWFsbHkgcHV0IHRoZW0gYmFjayBpbiBwbGFjZSBpbiB0aGUgcmVwbyAoaW4gY2Fz
ZSB0aGVzZSB3ZXJlIHJlbW92ZWQgYnkgZXJyb3IpPzwvbGk+PC9vbD48L2Rpdj48ZGl2IGRpcj0i
YXV0byI+VGhhbmtzLjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1
dG8iPjxicj48L2Rpdj4NCjxkaXYgaWQ9Im1fLTU1ODk2MDY4MTExMTQ4MDI3NjBhcW0tb3JpZ2lu
YWwiIHN0eWxlPSJjb2xvcjpibGFjaztmb250LWZhbWlseTpzYW5zLXNlcmlmIj4NCg0KPGRpdj4N
CjxkaXYgc3R5bGU9ImNvbG9yOmJsYWNrIj4NCjxwIHN0eWxlPSJjb2xvcjpibGFjaztmb250LXNp
emU6MTBwdDtmb250LWZhbWlseTpzYW5zLXNlcmlmO21hcmdpbjo4cHQgMHB4Ij5PbiBKYW51YXJ5
IDEwLCAyMDI0IDIyOjUyOjQ0IEpvbiBDb3JtaWVyICZsdDs8YSBocmVmPSJtYWlsdG86amNvcm1p
ZXJAY3JpdGljYWxsaW5rLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmpjb3JtaWVyQGNyaXRpY2FsbGlu
ay5jb208L2E+Jmd0OyB3cm90ZTo8L3A+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjbGFzcz0i
Z21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC43NWV4O2JvcmRlci1sZWZ0
OjFweCBzb2xpZCByZ2IoMTI4LDEyOCwxMjgpO3BhZGRpbmctbGVmdDowLjc1ZXgiPg0KPGRpdiBk
aXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9x
dW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIEZyaSwgSmFuIDUsIDIw
MjQgYXQgMzo0OeKAr0FNIEx1a2FzeiBQcnplbmlvc2xvICZsdDs8YSBocmVmPSJtYWlsdG86YnJl
bWVucGxAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+YnJlbWVucGxAZ21haWwuY29tPC9hPiZn
dDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9
Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwy
MDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5IZWxsbyw8YnI+DQpJIGhhdmUgcmVjZW50bHkgbW92
ZWQgZnJvbSBEdW5mZWxsIHRvIEtpcmtzdG9uZSBmb3IgdGhlIGJlYWdsZWJvbmUgbWFjaGluZS4g
U2luY2UgdGhlbiBJIGhhdmUgbm90aWNlZCB0aGF0IGNhbGxpbmcgZ3Bpb2luZm8gZnJvbSBsaWJn
cGlvZC10b29scyBkb2VzIG5vdCBzaG93IHRoZSBncGlvIGxhYmVsczo8YnI+DQo8YnI+DQpgYGA8
YnI+DQpyb290QGJlYWdsZWJvbmU6fiMgZ3Bpb2luZm88YnI+DQpncGlvY2hpcDAgLSAzMiBsaW5l
czo8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqAwOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDC
oHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAg
wqAxOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUt
aGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqAyOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDC
oCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5l
wqAgwqAzOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3Rp
dmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqA0OsKgIMKgIMKgIHVubmFtZWTCoCDC
oCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBs
aW5lwqAgwqA1OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBh
Y3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqA2OsKgIMKgIMKgIHVubmFtZWTC
oCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDC
oCBsaW5lwqAgwqA3OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTC
oCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqA4OsKgIMKgIMKgIHVubmFt
ZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDC
oCDCoCBsaW5lwqAgwqA5OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5w
dXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMTA6wqAgwqAgwqAgdW5u
YW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKg
IMKgIMKgIGxpbmXCoCAxMTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlu
cHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDEyOsKgIMKgIMKgIHVu
bmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDC
oCDCoCDCoCBsaW5lwqAgMTM6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBp
bnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxNDrCoCDCoCDCoCB1
bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAg
wqAgwqAgwqAgbGluZcKgIDE1OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKg
aW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMTY6wqAgwqAgwqAg
dW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKg
IMKgIMKgIMKgIGxpbmXCoCAxNzrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDC
oGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDE4OsKgIMKgIMKg
IHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrC
oCDCoCDCoCDCoCBsaW5lwqAgMTk6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAg
wqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAyMDrCoCDCoCDC
oCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0K
wqAgwqAgwqAgwqAgbGluZcKgIDIxOsKgIMKgIMKgIHVubmFtZWQgJnF1b3Q7YmVhZ2xlYm9uZTpn
cmVlbjp1c3IwJnF1b3Q7IG91dHB1dCBhY3RpdmUtaGlnaCBbdXNlZF08YnI+DQrCoCDCoCDCoCDC
oCBsaW5lwqAgMjI6wqAgwqAgwqAgdW5uYW1lZCAmcXVvdDtiZWFnbGVib25lOmdyZWVuOnVzcjEm
cXVvdDsgb3V0cHV0IGFjdGl2ZS1oaWdoIFt1c2VkXTxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAy
MzrCoCDCoCDCoCB1bm5hbWVkICZxdW90O2JlYWdsZWJvbmU6Z3JlZW46dXNyMiZxdW90OyBvdXRw
dXQgYWN0aXZlLWhpZ2ggW3VzZWRdPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDI0OsKgIMKgIMKg
IHVubmFtZWQgJnF1b3Q7YmVhZ2xlYm9uZTpncmVlbjp1c3IzJnF1b3Q7IG91dHB1dCBhY3RpdmUt
aGlnaCBbdXNlZF08YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjU6wqAgwqAgwqAgdW5uYW1lZMKg
IMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKg
IGxpbmXCoCAyNjrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAg
YWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDI3OsKgIMKgIMKgIHVubmFtZWTC
oCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDC
oCBsaW5lwqAgMjg6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKg
IGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAyOTrCoCDCoCDCoCB1bm5hbWVk
wqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAg
wqAgbGluZcKgIDMwOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTC
oCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMzE6wqAgwqAgwqAgdW5uYW1l
ZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCmdwaW9jaGlw
MSAtIDMyIGxpbmVzOjxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDA6wqAgwqAgwqAgdW5uYW1l
ZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKg
IMKgIGxpbmXCoCDCoDE6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1
dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDI6wqAgwqAgwqAgdW5u
YW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKg
IMKgIMKgIGxpbmXCoCDCoDM6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBp
bnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDQ6wqAgwqAgwqAg
dW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKg
IMKgIMKgIMKgIGxpbmXCoCDCoDU6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAg
wqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDY6wqAgwqAg
wqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4N
CsKgIMKgIMKgIMKgIGxpbmXCoCDCoDc6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2Vk
wqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDg6wqAg
wqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxi
cj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDk6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51
c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxMDrC
oCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2gg
PGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDExOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVu
dXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMTI6
wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdo
IDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxMzrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1
bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDE0
OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGln
aCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMTU6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKg
dW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAx
NjrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhp
Z2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDE3OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDC
oHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAg
MTg6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1o
aWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxOTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAg
wqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKg
IDIwOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUt
aGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjE6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKg
IMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXC
oCAyMjrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZl
LWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDIzOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDC
oCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5l
wqAgMjQ6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2
ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAyNTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAg
wqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGlu
ZcKgIDI2OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3Rp
dmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjc6wqAgwqAgwqAgdW5uYW1lZMKgIMKg
IMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxp
bmXCoCAyODrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0
aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDI5OsKgIMKgIMKgIHVubmFtZWTCoCDC
oCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBs
aW5lwqAgMzA6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFj
dGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAzMTrCoCDCoCDCoCB1bm5hbWVkwqAg
wqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KZ3Bpb2NoaXAyIC0g
MzIgbGluZXM6PGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIMKgMDrCoCDCoCDCoCB1bm5hbWVkwqAg
wqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAg
bGluZcKgIMKgMTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAg
YWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIMKgMjrCoCDCoCDCoCB1bm5hbWVk
wqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAg
wqAgbGluZcKgIMKgMzrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0
wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIMKgNDrCoCDCoCDCoCB1bm5h
bWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAg
wqAgwqAgbGluZcKgIMKgNTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlu
cHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIMKgNjrCoCDCoCDCoCB1
bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAg
wqAgwqAgwqAgbGluZcKgIMKgNzrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDC
oGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIMKgODrCoCDCoCDC
oCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0K
wqAgwqAgwqAgwqAgbGluZcKgIMKgOTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTC
oCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDEwOsKgIMKg
IMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+
DQrCoCDCoCDCoCDCoCBsaW5lwqAgMTE6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2Vk
wqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxMjrCoCDC
oCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJy
Pg0KwqAgwqAgwqAgwqAgbGluZcKgIDEzOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNl
ZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMTQ6wqAg
wqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxi
cj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxNTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVz
ZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDE2OsKg
IMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8
YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMTc6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51
c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxODrC
oCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2gg
PGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDE5OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVu
dXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjA6
wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdo
IDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAyMTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1
bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDIy
OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGln
aCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjM6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKg
dW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAy
NDrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhp
Z2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDI1OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDC
oHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAg
MjY6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1o
aWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAyNzrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAg
wqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKg
IDI4OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUt
aGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjk6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKg
IMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXC
oCAzMDrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZl
LWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDMxOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDC
oCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQpncGlvY2hpcDMgLSAzMiBs
aW5lczo8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqAwOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDC
oCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5l
wqAgwqAxOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3Rp
dmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqAyOsKgIMKgIMKgIHVubmFtZWTCoCDC
oCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBs
aW5lwqAgwqAzOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBh
Y3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqA0OsKgIMKgIMKgIHVubmFtZWTC
oCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDC
oCBsaW5lwqAgwqA1OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTC
oCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqA2OsKgIMKgIMKgIHVubmFt
ZWTCoCDCoCDCoCDCoCDCoCZxdW90O2NkJnF1b3Q7wqAgwqBpbnB1dMKgIMKgYWN0aXZlLWxvdyBb
dXNlZF08YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqA3OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDC
oCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5l
wqAgwqA4OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3Rp
dmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqA5OsKgIMKgIMKgIHVubmFtZWTCoCDC
oCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBs
aW5lwqAgMTA6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFj
dGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxMTrCoCDCoCDCoCB1bm5hbWVkwqAg
wqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAg
bGluZcKgIDEyOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBh
Y3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMTM6wqAgwqAgwqAgdW5uYW1lZMKg
IMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKg
IGxpbmXCoCAxNDrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAg
YWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDE1OsKgIMKgIMKgIHVubmFtZWTC
oCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDC
oCBsaW5lwqAgMTY6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKg
IGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxNzrCoCDCoCDCoCB1bm5hbWVk
wqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAg
wqAgbGluZcKgIDE4OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTC
oCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMTk6wqAgwqAgwqAgdW5uYW1l
ZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKg
IMKgIGxpbmXCoCAyMDrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0
wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDIxOsKgIMKgIMKgIHVubmFt
ZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDC
oCDCoCBsaW5lwqAgMjI6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1
dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAyMzrCoCDCoCDCoCB1bm5h
bWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAg
wqAgwqAgbGluZcKgIDI0OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5w
dXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjU6wqAgwqAgwqAgdW5u
YW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKg
IMKgIMKgIGxpbmXCoCAyNjrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlu
cHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDI3OsKgIMKgIMKgIHVu
bmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDC
oCDCoCDCoCBsaW5lwqAgMjg6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBp
bnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAyOTrCoCDCoCDCoCB1
bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAg
wqAgwqAgwqAgbGluZcKgIDMwOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKg
aW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMzE6wqAgwqAgwqAg
dW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoPGJyPg0KYGBg
PGJyPg0KPGJyPg0KMS4gV2hhdCBjb3VsZCBiZSB0aGUgY2F1c2UgZm9yIHRoYXQgKGV4YWN0IGRp
ZmZlcmVudCBiZXR3ZWVuIER1bmZlbGwgYW5kIEtpcmtzdG9uZSBpbiBtZXRhLXRpKT8gQ2FuIGl0
IGJlIHRoYXQgdGhlIHJlbGV2YW50IGR0cyBmaWxlKHMpIHNvbWVob3cgY2hhbmdlZD88YnI+PC9i
bG9ja3F1b3RlPjxkaXY+VGhlIGdwaW8gbmFtZXMgYXJlIGRlZmluZWQgaW4gdGhlIGRldmljZSB0
cmVlIGJ5IGRlZmluaW5nICZxdW90O2dwaW8tbGluZS1uYW1lcyA9IC4uLiZxdW90OzwvZGl2Pjxk
aXY+RXhhbXBsZSBmb3IgdGhlIGFtMzM1eC1ib25lYmxhY2suZHRzIGZyb20gVElzIDYuMSBrZXJu
ZWwuIDxhIGhyZWY9Imh0dHBzOi8vZ2l0LnRpLmNvbS9jZ2l0L3RpLWxpbnV4LWtlcm5lbC90aS1s
aW51eC1rZXJuZWwvdHJlZS9hcmNoL2FybS9ib290L2R0cy9hbTMzNXgtYm9uZWJsYWNrLmR0cz9o
PXRpLWxpbnV4LTYuMS55I24yOSIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0LnRpLmNvbS9j
Z2l0L3RpLWxpbnV4LWtlcm5lbC90aS1saW51eC1rZXJuZWwvdHJlZS9hcmNoL2FybS9ib290L2R0
cy9hbTMzNXgtYm9uZWJsYWNrLmR0cz9oPXRpLWxpbnV4LTYuMS55I24yOTwvYT48L2Rpdj48Ymxv
Y2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44
ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFl
eCI+DQoyLiBBc2lkZSBmcm9tIGxhYmVscyBtaXNzaW5nLCBjYW4gdGhlcmUgYmUgYW55IG90aGVy
IGNvbnNlcXVlbmNlcyBoZXJlPyBJIHRlc3RlZCBncGlvIG91dHB1dHMgc3RhdGUgY2hhbmdpbmcg
YW5kIGl0IHdvcmtzIG5vcm1hbGx5Ljxicj48L2Jsb2NrcXVvdGU+PGRpdj5JJiMzOTtkIGd1ZXNz
IG5vLCBvdGhlciB0aGFuIGl0IGJlaW5nIGhhcmRlciB0byBpZGVudGlmeSB0aGUgY29ycmVjdCBn
cGlvLiA8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFy
Z2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwy
MDQpO3BhZGRpbmctbGVmdDoxZXgiPg0KPGJyPg0KSSB3b3VsZCBhcHByZWNpYXRlIGFsbCBoZWxw
IGFuZCBmZWVkYmFjayE8YnI+DQo8YnI+DQotPS09LT0tPS09LT0tPS09LT0tPS09LTxicj4NCkxp
bmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLjxicj4NClZp
ZXcvUmVwbHkgT25saW5lICgjMTczODQpOiA8YSBocmVmPSJodHRwczovL2xpc3RzLnlvY3RvcHJv
amVjdC5vcmcvZy9tZXRhLXRpL21lc3NhZ2UvMTczODQiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdGkvbWVzc2Fn
ZS8xNzM4NDwvYT48YnI+DQpNdXRlIFRoaXMgVG9waWM6IDxhIGhyZWY9Imh0dHBzOi8vbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZy9tdC8xMDM1Mzk2NjgvNzkwMjYyMSIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL210LzEwMzUzOTY2
OC83OTAyNjIxPC9hPjxicj4NCkdyb3VwIE93bmVyOiA8YSBocmVmPSJtYWlsdG86bWV0YS10aSUy
Qm93bmVyQGxpc3RzLnlvY3RvcHJvamVjdC5vcmciIHRhcmdldD0iX2JsYW5rIj5tZXRhLXRpK293
bmVyQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc8L2E+PGJyPg0KVW5zdWJzY3JpYmU6IDxhIGhyZWY9
Imh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdGkvdW5zdWIiIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9n
L21ldGEtdGkvdW5zdWI8L2E+IFs8YSBocmVmPSJtYWlsdG86amNvcm1pZXJAY3JpdGljYWxsaW5r
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmpjb3JtaWVyQGNyaXRpY2FsbGluay5jb208L2E+XTxicj4N
Ci09LT0tPS09LT0tPS09LT0tPS09LT0tPGJyPg0KPGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2Pjxi
ciBjbGVhcj0iYWxsIj48YnI+PHNwYW4gY2xhc3M9ImdtYWlsX3NpZ25hdHVyZV9wcmVmaXgiPi0t
IDwvc3Bhbj48YnI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX3NpZ25hdHVyZSI+PGRpdiBk
aXI9Imx0ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRp
diBkaXI9Imx0ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48ZGl2PkpvbmF0aGFuIENvcm1pZXI8YnI+
U29mdHdhcmUgRW5naW5lZXI8ZGl2PjxkaXY+PGRpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+
PHNwYW4gc3R5bGU9ImNvbG9yOnJnYigwLDAsMCkiPlZvaWNlOsKgwqA8YSB2YWx1ZT0iKzEzMTU0
MjU0MDQ1Ij4zMTUuNDI1LjQwNDU8L2E+wqB4MjIyPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5
bGU9ImNvbG9yOnJnYigwLDAsMCkiPjxicj48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0i
Y29sb3I6cmdiKDAsMCwwKSI+PGltZyBzcmM9Imh0dHBzOi8vY2kzLmdvb2dsZXVzZXJjb250ZW50
LmNvbS9tYWlsLXNpZy9BSW9ySzR4bWw3NWZKUEtZRjdNOVg1RHV4NElyYnR6WmswUkI2amY4aUJZ
dVBRS0FycmtCa09rVTRISjJyUDdlSDZkMmg3X2l0dU1XRUJjIj48YnI+PC9zcGFuPjwvZGl2Pjwv
ZGl2PjwvZGl2PjxkaXY+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6cmdiKDE3LDg1LDIwNCkiPjxi
cj48L3NwYW4+PC9kaXY+PGRpdj48YSBocmVmPSJodHRwOi8vd3d3LmNyaXRpY2FsbGluay5jb20v
IiB0YXJnZXQ9Il9ibGFuayI+PHNwYW4gc3R5bGU9ImNvbG9yOnJnYigxNyw4NSwyMDQpIj5odHRw
Oi8vd3d3LkNyaXRpY2FsTGluay5jb208L3NwYW4+PC9hPjxicj48L2Rpdj48ZGl2PjY3MTIgQnJv
b2tsYXduIFBhcmt3YXkswqBTeXJhY3VzZSwgTlkgMTMyMTHCoDwvZGl2PjwvZGl2PjwvZGl2Pjxk
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6cmdiKDE3LDg1LDIwNCki
PjxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoMTcsODUsMjA0KSI+PGEgaHJlZj0iaHR0cHM6Ly93d3cu
bGlua2VkaW4uY29tL2NvbXBhbnkvY3JpdGljYWwtbGluay1sbGMiIHRhcmdldD0iX2JsYW5rIj48
aW1nIHNyYz0iaHR0cHM6Ly9kb2NzLmdvb2dsZS5jb20vdWM/ZXhwb3J0PWRvd25sb2FkJmFtcDtp
ZD0wQjJ2TlNudS1hWXU2T0VoSFJXOUJVRlY1V25NJmFtcDtyZXZpZD0wQjJ2TlNudS1hWXU2UkhO
WlVuaE5iRnBFUjFsM2VtTlFZMlZvYUhBMFJEZHVkV2xGUFEiPjwvYT7CoMKgPGEgaHJlZj0iaHR0
cHM6Ly90d2l0dGVyLmNvbS9Dcml0aWNhbF9MaW5rIiB0YXJnZXQ9Il9ibGFuayI+PGltZyBhbHQ9
IiIgc3JjPSJodHRwczovL2RvY3MuZ29vZ2xlLmNvbS91Yz9leHBvcnQ9ZG93bmxvYWQmYW1wO2lk
PTBCMnZOU251LWFZdTZjVTF5V0VSckxYRTBTbk0mYW1wO3JldmlkPTBCMnZOU251LWFZdTZiMVly
WlcxU00waHVlVmhWUzBwUFdtMUlPWEZTYzBJM2F5OWpQUSI+PC9hPjwvc3Bhbj48L3NwYW4+PC9k
aXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+
PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4NCjwv
ZGl2Pg0KDQoNCjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+DQo8L2Rpdj48L2Rpdj4N
Cg0KPC9ibG9ja3F1b3RlPjwvZGl2PjxiciBjbGVhcj0iYWxsIj48YnI+PHNwYW4gY2xhc3M9Imdt
YWlsX3NpZ25hdHVyZV9wcmVmaXgiPi0tIDwvc3Bhbj48YnI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9
ImdtYWlsX3NpZ25hdHVyZSI+PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48ZGl2
PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48
ZGl2PkpvbmF0aGFuIENvcm1pZXI8YnI+U29mdHdhcmUgRW5naW5lZXI8ZGl2PjxkaXY+PGRpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+PGZvbnQgY29sb3I9IiMwMDAwMDAiPlZvaWNlOsKgwqA8
YSB2YWx1ZT0iKzEzMTU0MjU0MDQ1Ij4zMTUuNDI1LjQwNDU8L2E+wqB4MjIyPC9mb250PjwvZGl2
PjxkaXY+PGZvbnQgY29sb3I9IiMwMDAwMDAiPjxicj48L2ZvbnQ+PC9kaXY+PGRpdj48Zm9udCBj
b2xvcj0iIzAwMDAwMCI+PGltZyBzcmM9Imh0dHBzOi8vY2kzLmdvb2dsZXVzZXJjb250ZW50LmNv
bS9tYWlsLXNpZy9BSW9ySzR4bWw3NWZKUEtZRjdNOVg1RHV4NElyYnR6WmswUkI2amY4aUJZdVBR
S0FycmtCa09rVTRISjJyUDdlSDZkMmg3X2l0dU1XRUJjIj48YnI+PC9mb250PjwvZGl2PjwvZGl2
PjwvZGl2PjxkaXY+PGRpdj48Zm9udCBjb2xvcj0iIzExNTVjYyI+PGJyPjwvZm9udD48L2Rpdj48
ZGl2PjxhIGhyZWY9Imh0dHA6Ly93d3cuY3JpdGljYWxsaW5rLmNvbS8iIHRhcmdldD0iX2JsYW5r
Ij48Zm9udCBjb2xvcj0iIzExNTVjYyI+aHR0cDovL3d3dy5Dcml0aWNhbExpbmsuY29tPC9mb250
PjwvYT48YnI+PC9kaXY+PGRpdj42NzEyIEJyb29rbGF3biBQYXJrd2F5LMKgU3lyYWN1c2UsIE5Z
IDEzMjExwqA8L2Rpdj48L2Rpdj48L2Rpdj48ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGZvbnQg
Y29sb3I9IiMxMTU1Y2MiPjxmb250IGNvbG9yPSIjMTE1NWNjIj48YSBocmVmPSJodHRwczovL3d3
dy5saW5rZWRpbi5jb20vY29tcGFueS9jcml0aWNhbC1saW5rLWxsYyIgdGFyZ2V0PSJfYmxhbmsi
PjxpbWcgc3JjPSJodHRwczovL2RvY3MuZ29vZ2xlLmNvbS91Yz9leHBvcnQ9ZG93bmxvYWQmYW1w
O2lkPTBCMnZOU251LWFZdTZPRWhIUlc5QlVGVjVXbk0mYW1wO3JldmlkPTBCMnZOU251LWFZdTZS
SE5aVW5oTmJGcEVSMWwzZW1OUVkyVm9hSEEwUkRkdWRXbEZQUSI+PC9hPsKgwqA8YSBocmVmPSJo
dHRwczovL3R3aXR0ZXIuY29tL0NyaXRpY2FsX0xpbmsiIHRhcmdldD0iX2JsYW5rIj48aW1nIGFs
dD0iIiBzcmM9Imh0dHBzOi8vZG9jcy5nb29nbGUuY29tL3VjP2V4cG9ydD1kb3dubG9hZCZhbXA7
aWQ9MEIydk5TbnUtYVl1NmNVMXlXRVJyTFhFMFNuTSZhbXA7cmV2aWQ9MEIydk5TbnUtYVl1NmIx
WXJaVzFTTTBodWVWaFZTMHBQV20xSU9YRlNjMEkzYXk5alBRIj48L2E+PC9mb250PjwvZm9udD48
L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rp
dj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4NCg==
--0000000000001b7804060e9ee171--

