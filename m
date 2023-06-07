Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C513BC7EE23
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 10:21:56 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4916.1686133308683235687
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 03:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=RZAxakP3;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 357ALkvl106046;
	Wed, 7 Jun 2023 05:21:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686133306;
	bh=QliYMOq7JJkE+pAC+fR7EzPT/ikPnesTR74mTfrKwgU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RZAxakP3tPVIwfXqCv3tCUrE4YdZgUdQ0hdysBOGzTvHcr9RsROISz2eFRfnK+SY6
	 V/Tl3Ue27GB+fA63XvZo6teT90aKGXT58v1MDsreomk258OmRqC2XW+6fY4y4DrDb6
	 Ya44BpaUTtb81+Ci/XUAMQ2/JGr1mhdUx7QF2v5M=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 357ALkEP022645
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 05:21:46 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 05:21:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 05:21:46 -0500
Received: from [172.24.145.229] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 357ALiCN114016;
	Wed, 7 Jun 2023 05:21:44 -0500
Content-Type: multipart/alternative;
	boundary="------------Q2y5U9L0pL9TWgaKS9a2w9D1"
Message-ID: <d5502986-07b7-176b-e7c5-b931b0473b83@ti.com>
Date: Wed, 7 Jun 2023 15:51:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] Re: [meta-ti] [kirkstone][PATCH v2] meta-ti-bsp: Add
 recipe for u-boot-ti-jailhouse and linux-ti-jailhouse
Content-Language: en-US
To: Ricardo Salveti <ricardo@foundries.io>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <c-shilwant@ti.com>,
        <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
References: <20230605131152.69991-1-p-bhagat@ti.com>
 <1765C66D190BA797.3349@lists.yoctoproject.org>
 <4a980318-4b35-f2a8-c7cd-242f5a99ef57@ti.com>
 <CAAaKDhHS7dHPPQ7YpuzUg5ff7aNnntJdOavv2Q=wwes5GRG2qQ@mail.gmail.com>
 <e218a5d7-dbcd-9afc-1cec-d10cef036870@ti.com>
 <CAAaKDhFuDVmKERbFHfsu1T+r5-hv=412wy=B9eb0WN=ufJzy9g@mail.gmail.com>
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <CAAaKDhFuDVmKERbFHfsu1T+r5-hv=412wy=B9eb0WN=ufJzy9g@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Jun 2023 10:21:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16685

--------------Q2y5U9L0pL9TWgaKS9a2w9D1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 357ALkvl106046

Hi Ricardo,

On 06/06/23 21:57, Ricardo Salveti wrote:
> On Tue, Jun 6, 2023 at 8:59=E2=80=AFAM Paresh Bhagat<p-bhagat@ti.com>  =
wrote:
>> Hi,
>>
>> On 06/06/23 03:29, Ricardo Salveti wrote:
>>> On Mon, Jun 5, 2023 at 5:25=E2=80=AFPM Ryan Eatmon via lists.yoctopro=
ject.org
>>> <reatmon=3Dti.com@lists.yoctoproject.org>  wrote:
>>>> On 6/5/2023 8:30 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>>> On 6/5/2023 8:11 AM, Paresh Bhagat wrote:
>>>>>> Add new recipe for u-boot-ti-jailhouse and linux-ti-jailhouse whic=
h will
>>>>>> be used for jailhouse for am62xx-evm.
>>>>>>
>>>>>> Jailhouse support for am62xx-evm requires few patches for u-boot a=
nd
>>>>>> linux
>>>>>> which are hosted at processor-sdk/u-boot and processor/linux
>>>>>> respectively.
>>>>>> To build a image with jailhouse for am62xx-evm, these recipes
>>>>>> will be used instead of u-boot-ti-staging and linux-ti-staging by
>>>>>> changing
>>>>>> the preferred_provider.
>>>>>>
>>>>>> Signed-off-by: Paresh Bhagat<p-bhagat@ti.com>
>>>>>> ---
>>>>>>     .../recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb    | 9 +=
++++++++
>>>>>>     .../recipes-kernel/linux/linux-ti-jailhouse_6.1.bb       | 9 +=
++++++++
>>>>>>     2 files changed, 18 insertions(+)
>>>>>>     create mode 100644
>>>>>> meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>>>>>     create mode 100644
>>>>>> meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
>>>>>>
>>>>>> diff --git
>>>>>> a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>>>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>>>>> new file mode 100644
>>>>>> index 00000000..079d55dd
>>>>>> --- /dev/null
>>>>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.b=
b
>>>>>> @@ -0,0 +1,9 @@
>>>>>> +require u-boot-ti-staging_2023.04.bb
>>>>>> +
>>>>>> +# This will have priority over generic uboot path
>>>>>> +
>>>>>> +BRANCH =3D "ti-u-boot-2023.04-jailhouse"
>>>>>> +
>>>>>> +UBOOT_GIT_URI =3D "git://git.ti.com/git/processor-sdk/u-boot.git"
>>>>> What is reasoning for not upstreaming these patches (both u-boot an=
d
>>>>> kernel) even just into the TI repositories?
>>>>>
>>>>> My concern is the CICD process.  This is adding another recipe with=
 a
>>>>> completely different linux/u-boot repository that we need to add su=
pport
>>>>> for to keep the recipes up to date.
>>>>>
>>>>> And you guys will to keep rebasing these patches on top of the late=
st
>>>>> 6.1 prod branch when CICD promotes.
>>>>>
>>>>> This just feels like something that is going to turn into a lot of
>>>>> maintenance work in the future.
>>>> After discussing this with Praneeth, these recipes should not be cal=
led
>>>> jailhouse, but rather something more generic (maybe experiments).  W=
e do
>>>> not want to explode the number of recipes in the directory with ever=
y
>>>> experiment we want to run in the future...  We can then configure wh=
ich
>>>> branch under the experiments to pick based on something in the distr=
o
>>>> features or via machine features.
>>>>
>>>> And upon further reflection, do we want to create a new layer under =
the
>>>> meta-ti repo to house all of these new changes and not host them in
>>>> meta-ti-bsp?  Basically keep meta-ti-bsp as the production versions =
of
>>>> code?  Any thoughs Andrew, Denys, Randolph?
>>> For experiments I think it makes sense to have it hosted in another
>>> layer, but in this case jailhouse is an official functionality that i=
s
>>> also supported by TI, isn't it?
>>>
>>> My concern is that real customers might want to have jailhouse
>>> enabled, which will force them to use this extra layer which might no=
t
>>> necessarily be aligned with the main bsp revision used (e.g. kernel
>>> and u-boot), causing maintenance issues for product builders.
>>>
>>> Maybe in this case it is just better to have the patches available in
>>> the layer and enabled dynamically via machine features? It is still a
>>> pain to maintain as it might have conflicts in the future and might
>>> require patch updates, but if indeed a desired feature it might make
>>> sense to be part of the main layer.
>> We need to support various distros going forward, so it must not be ti=
ed
>> to Yocto layers, hence the seperate repos. Additionally, users must be
>> able to use git kernel tree without going to worry about applying
>> patches. We want to carry these changes as maintainable branch instead
>> of *.patch files in meta-ti-bsp.
> Then how are you planning on updating these extra branches moving
> forward? Rebases? Merges from the main branch?
>
> Just trying to understand how to best align this with customers
> wanting to use jailhouse, since they might end up being behind from
> the main bsp tree if the branch ends up being behind.
>
> In or out yocto the maintenance pain will exist.
>
> Cheers,

It will be merge from the main branch. However, these repos will be=20
setup to have auto merged.

Thanks,

Paresh

--------------Q2y5U9L0pL9TWgaKS9a2w9D1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 357ALkvl106046

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi Ricardo,
</p>
    <div class=3D"moz-cite-prefix">On 06/06/23 21:57, Ricardo Salveti
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAAaKDhFuDVmKERbFHfsu1T+r5-hv=3D412wy=3DB9eb0WN=3DufJzy9g@mai=
l.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Tue, Jun 6, 2023 at 8:59=E2=
=80=AFAM Paresh Bhagat <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
p-bhagat@ti.com">&lt;p-bhagat@ti.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Hi,

On 06/06/23 03:29, Ricardo Salveti wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, Jun 5, 2023 at 5=
:25=E2=80=AFPM Ryan Eatmon via lists.yoctoproject.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:reatmon=3Dti.com@lists.=
yoctoproject.org">&lt;reatmon=3Dti.com@lists.yoctoproject.org&gt;</a> wro=
te:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">On 6/5/2023 8:30 AM, R=
yan Eatmon via lists.yoctoproject.org wrote:
</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">On 6/5/2023 8:11 AM,=
 Paresh Bhagat wrote:
</pre>
              <blockquote type=3D"cite">
                <pre class=3D"moz-quote-pre" wrap=3D"">Add new recipe for=
 u-boot-ti-jailhouse and linux-ti-jailhouse which will
be used for jailhouse for am62xx-evm.

Jailhouse support for am62xx-evm requires few patches for u-boot and
linux
which are hosted at processor-sdk/u-boot and processor/linux
respectively.
To build a image with jailhouse for am62xx-evm, these recipes
will be used instead of u-boot-ti-staging and linux-ti-staging by
changing
the preferred_provider.

Signed-off-by: Paresh Bhagat <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:p-bhagat@ti.com">&lt;p-bhagat@ti.com&gt;</a>
---
   .../recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb    | 9 +++++++++
   .../recipes-kernel/linux/linux-ti-jailhouse_6.1.bb       | 9 +++++++++
   2 files changed, 18 insertions(+)
   create mode 100644
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
   create mode 100644
meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb

diff --git
a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
new file mode 100644
index 00000000..079d55dd
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
@@ -0,0 +1,9 @@
+require u-boot-ti-staging_2023.04.bb
+
+# This will have priority over generic uboot path
+
+BRANCH =3D "ti-u-boot-2023.04-jailhouse"
+
+UBOOT_GIT_URI =3D "git://git.ti.com/git/processor-sdk/u-boot.git"
</pre>
              </blockquote>
              <pre class=3D"moz-quote-pre" wrap=3D"">What is reasoning fo=
r not upstreaming these patches (both u-boot and
kernel) even just into the TI repositories?

My concern is the CICD process.  This is adding another recipe with a
completely different linux/u-boot repository that we need to add support
for to keep the recipes up to date.

And you guys will to keep rebasing these patches on top of the latest
6.1 prod branch when CICD promotes.

This just feels like something that is going to turn into a lot of
maintenance work in the future.
</pre>
            </blockquote>
            <pre class=3D"moz-quote-pre" wrap=3D"">
After discussing this with Praneeth, these recipes should not be called
jailhouse, but rather something more generic (maybe experiments).  We do
not want to explode the number of recipes in the directory with every
experiment we want to run in the future...  We can then configure which
branch under the experiments to pick based on something in the distro
features or via machine features.

And upon further reflection, do we want to create a new layer under the
meta-ti repo to house all of these new changes and not host them in
meta-ti-bsp?  Basically keep meta-ti-bsp as the production versions of
code?  Any thoughs Andrew, Denys, Randolph?
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">For experiments I think =
it makes sense to have it hosted in another
layer, but in this case jailhouse is an official functionality that is
also supported by TI, isn't it?

My concern is that real customers might want to have jailhouse
enabled, which will force them to use this extra layer which might not
necessarily be aligned with the main bsp revision used (e.g. kernel
and u-boot), causing maintenance issues for product builders.

Maybe in this case it is just better to have the patches available in
the layer and enabled dynamically via machine features? It is still a
pain to maintain as it might have conflicts in the future and might
require patch updates, but if indeed a desired feature it might make
sense to be part of the main layer.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
We need to support various distros going forward, so it must not be tied
to Yocto layers, hence the seperate repos. Additionally, users must be
able to use git kernel tree without going to worry about applying
patches. We want to carry these changes as maintainable branch instead
of *.patch files in meta-ti-bsp.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Then how are you planning on updating these extra branches moving
forward? Rebases? Merges from the main branch?

Just trying to understand how to best align this with customers
wanting to use jailhouse, since they might end up being behind from
the main bsp tree if the branch ends up being behind.

In or out yocto the maintenance pain will exist.

Cheers,</pre>
    </blockquote>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">It will be merge from=
 the main branch. However, these repos will be setup to have auto merged.=
</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">
</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">Thanks,</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">Paresh
</p>
    <style type=3D"text/css">p, li { white-space: pre-wrap; }</style>
    <blockquote type=3D"cite"
cite=3D"mid:CAAaKDhFuDVmKERbFHfsu1T+r5-hv=3D412wy=3DB9eb0WN=3DufJzy9g@mai=
l.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
  </body>
</html>

--------------Q2y5U9L0pL9TWgaKS9a2w9D1--

