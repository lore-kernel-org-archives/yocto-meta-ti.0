Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.7765.1575655618041829573
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Dec 2019 10:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sxhn1yYB;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 92F25E01158; Fri,  6 Dec 2019 10:06:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_MED autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48B63E01156
	for <meta-ti@yoctoproject.org>; Fri,  6 Dec 2019 10:06:56 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB6I6tSf075977
	for <meta-ti@yoctoproject.org>; Fri, 6 Dec 2019 12:06:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575655615;
	bh=7mzK8anyHHUCqoearr1KgldJ1cFHy9pY3JCN+ds99/g=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=sxhn1yYBi2yQbhzjn7pBDAvXlHX05nhynSgTMz5RnCUDvOAiMV14zFUZFc1j7lxVz
	 Uf7AtnYiwp+DMa1Pg6js51Z9mr4+MkUSclHWTdOjkYGbjrzTQqDRW9X2D6sI13+KqH
	 m5M6dXCwBLSJOnyFC+/4Y2LdC1Hv8ivOVXMJLhPo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB6I6tEj028084
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 6 Dec 2019 12:06:55 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 6 Dec
 2019 12:06:55 -0600
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
 DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%17]) with mapi id
 15.01.1847.003; Fri, 6 Dec 2019 12:06:55 -0600
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
CC: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti] [master/thud][PATCH 24/42] pru: migrate to ti-pdk-fetch.bbclass
Thread-Topic: [meta-ti] [master/thud][PATCH 24/42] pru: migrate to
 ti-pdk-fetch.bbclass
Thread-Index: AQHVrFJLffNQbtiTWUO77m2YsyhR0aetv2wA//+n0kU=
Date: Fri, 6 Dec 2019 18:06:55 +0000
Message-ID: <c8cecb9d-2344-4969-baf3-475caee7366e@email.android.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
 <1573830902-17409-25-git-send-email-j-stiffler@ti.com>
 <20191206162913.GU24609@beryl>,<a5cf7ee7-fb1d-5002-b07f-99ba9ab4230d@ti.com>
In-Reply-To: <a5cf7ee7-fb1d-5002-b07f-99ba9ab4230d@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_c8cecb9d23444969baf3475caee7366eemailandroidcom_"

--_000_c8cecb9d23444969baf3475caee7366eemailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

v2 would be nice, thanks.


On Dec 6, 2019 12:22, "Stiffler, Jacob" <j-stiffler@ti.com> wrote:

On 12/6/2019 11:29 AM, Denys Dmytriyenko wrote:
> On Fri, Nov 15, 2019 at 10:14:44AM -0500, Jacob Stiffler wrote:
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   recipes-bsp/pru/pru-pwm-fw_git.bb    | 11 +++++------
>>   recipes-bsp/pru/pru-swuart-fw_git.bb | 12 ++++++------
>>   2 files changed, 11 insertions(+), 12 deletions(-)
>>
>> diff --git a/recipes-bsp/pru/pru-pwm-fw_git.bb b/recipes-bsp/pru/pru-pwm=
-fw_git.bb
> This seems to break pru-pwm-fw on am65xx:
>
> "iepPwm.c", line 594: error #20: identifier "CSL_ICSS_IEP0_CFG_BASE" is u=
ndefined
> "iepPwm.c", line 600: error #20: identifier "CSL_ICSS_IEP1_CFG_BASE" is u=
ndefined
>
> Jake, do you know if this can be fixed quickly, so I don't have to drop 4=
2
> patches from next branch? Thanks!


This depends on some CSL updates which are not quite ready yet. We
should be able to revert to an older commit
("38857bc991494e8662d3ab7624b8ac5f026477c8"). Shall I submit a v2 with
this commit?


> Denys
>
>
>> index 0fe7987..a8c7103 100644
>> --- a/recipes-bsp/pru/pru-pwm-fw_git.bb
>> +++ b/recipes-bsp/pru/pru-pwm-fw_git.bb
>> @@ -8,17 +8,16 @@ require recipes-ti/includes/ti-paths.inc
>>   COMPATIBLE_MACHINE =3D "am65xx"
>>   PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>
>> -# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.15B"
>> -SRCREV =3D "989f802266d52f50a6db8f2be6967eacd9d2b409"
>>
>> -PV =3D "01.00.00.15B"
>>
>> -BRANCH =3D "master"
>> -SRC_URI =3D "git://git.ti.com/keystone-rtos/pruss-lld.git;protocol=3Dgi=
t;branch=3D${BRANCH}"
>> +inherit ti-pdk-fetch
>> +
>> +TI_PDK_COMP =3D "ti.drv.pruss.example.apps.icssg_pwm.firmware.src"
>> +
>> +PE =3D "1"
>>
>>   DEPENDS =3D "ti-cgt-pru-native pru-icss common-csl-ip-rtos"
>>
>> -S =3D "${WORKDIR}/git/example/apps/icssg_pwm/firmware/src"
>>
>>   EXTRA_OEMAKE +=3D " \
>>       PRU_CGT=3D"${TI_CGT_PRU_INSTALL_DIR}" \
>> diff --git a/recipes-bsp/pru/pru-swuart-fw_git.bb b/recipes-bsp/pru/pru-=
swuart-fw_git.bb
>> index e22b3be..1cb51f3 100644
>> --- a/recipes-bsp/pru/pru-swuart-fw_git.bb
>> +++ b/recipes-bsp/pru/pru-swuart-fw_git.bb
>> @@ -8,20 +8,20 @@ require recipes-ti/includes/ti-paths.inc
>>   COMPATIBLE_MACHINE =3D "ti33x"
>>   PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>
>> -# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.15"
>> -SRCREV =3D "4493f456549c85749a05b1f46bf0b75d23976db1"
>>
>> -PV =3D "01.00.00.15"
>> +inherit ti-pdk-fetch
>>
>> -BRANCH =3D "master"
>> -SRC_URI =3D "git://git.ti.com/keystone-rtos/uart-lld.git;protocol=3Dgit=
;branch=3D${BRANCH} \
>> +TI_PDK_COMP =3D "ti.drv.uart"
>> +
>> +PE =3D "1"
>> +
>> +SRC_URI_append =3D " \
>>       file://0001-icss_uart-add-Makefile-for-building-firmware.patch \
>>       file://0001-icss_uart-remove-dependency-on-PDK-CSL.patch \
>>   "
>>
>>   DEPENDS =3D "ti-cgt-pru-native pru-icss"
>>
>> -S =3D "${WORKDIR}/git"
>>
>>   export PRU_CGT =3D "${TI_CGT_PRU_INSTALL_DIR}"
>>   export PRU_SSP =3D "${STAGING_DIR_TARGET}/usr"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

--_000_c8cecb9d23444969baf3475caee7366eemailandroidcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto">v2 would be nice, thanks.
<div dir=3D"auto"><br>
</div>
</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">On Dec 6, 2019 12:22, &quot;Stiffler, Jacob&qu=
ot; &lt;j-stiffler@ti.com&gt; wrote:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText"><br>
On 12/6/2019 11:29 AM, Denys Dmytriyenko wrote:<br>
&gt; On Fri, Nov 15, 2019 at 10:14:44AM -0500, Jacob Stiffler wrote:<br>
&gt;&gt; Signed-off-by: Jacob Stiffler &lt;j-stiffler@ti.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp;&nbsp; recipes-bsp/pru/pru-pwm-fw_git.bb&nbsp;&nbsp;&nbsp; | =
11 &#43;&#43;&#43;&#43;&#43;------<br>
&gt;&gt;&nbsp;&nbsp; recipes-bsp/pru/pru-swuart-fw_git.bb | 12 &#43;&#43;&#=
43;&#43;&#43;&#43;------<br>
&gt;&gt;&nbsp;&nbsp; 2 files changed, 11 insertions(&#43;), 12 deletions(-)=
<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/recipes-bsp/pru/pru-pwm-fw_git.bb b/recipes-bsp/pru/p=
ru-pwm-fw_git.bb<br>
&gt; This seems to break pru-pwm-fw on am65xx:<br>
&gt;<br>
&gt; &quot;iepPwm.c&quot;, line 594: error #20: identifier &quot;CSL_ICSS_I=
EP0_CFG_BASE&quot; is undefined<br>
&gt; &quot;iepPwm.c&quot;, line 600: error #20: identifier &quot;CSL_ICSS_I=
EP1_CFG_BASE&quot; is undefined<br>
&gt;<br>
&gt; Jake, do you know if this can be fixed quickly, so I don't have to dro=
p 42<br>
&gt; patches from next branch? Thanks!<br>
<br>
<br>
This depends on some CSL updates which are not quite ready yet. We <br>
should be able to revert to an older commit <br>
(&quot;38857bc991494e8662d3ab7624b8ac5f026477c8&quot;). Shall I submit a v2=
 with <br>
this commit?<br>
<br>
<br>
&gt; Denys<br>
&gt;<br>
&gt;<br>
&gt;&gt; index 0fe7987..a8c7103 100644<br>
&gt;&gt; --- a/recipes-bsp/pru/pru-pwm-fw_git.bb<br>
&gt;&gt; &#43;&#43;&#43; b/recipes-bsp/pru/pru-pwm-fw_git.bb<br>
&gt;&gt; @@ -8,17 &#43;8,16 @@ require recipes-ti/includes/ti-paths.inc<br>
&gt;&gt;&nbsp;&nbsp; COMPATIBLE_MACHINE =3D &quot;am65xx&quot;<br>
&gt;&gt;&nbsp;&nbsp; PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt; -# Below commit ID corresponds to &quot;DEV.PRUSS_LLD.01.00.00.15B=
&quot;<br>
&gt;&gt; -SRCREV =3D &quot;989f802266d52f50a6db8f2be6967eacd9d2b409&quot;<b=
r>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt; -PV =3D &quot;01.00.00.15B&quot;<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt; -BRANCH =3D &quot;master&quot;<br>
&gt;&gt; -SRC_URI =3D &quot;git://git.ti.com/keystone-rtos/pruss-lld.git;pr=
otocol=3Dgit;branch=3D${BRANCH}&quot;<br>
&gt;&gt; &#43;inherit ti-pdk-fetch<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;TI_PDK_COMP =3D &quot;ti.drv.pruss.example.apps.icssg_pwm.fir=
mware.src&quot;<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;PE =3D &quot;1&quot;<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&nbsp;&nbsp; DEPENDS =3D &quot;ti-cgt-pru-native pru-icss common-cs=
l-ip-rtos&quot;<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt; -S =3D &quot;${WORKDIR}/git/example/apps/icssg_pwm/firmware/src&qu=
ot;<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&nbsp;&nbsp; EXTRA_OEMAKE &#43;=3D &quot; \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PRU_CGT=3D&quot;${TI_CGT_PRU_I=
NSTALL_DIR}&quot; \<br>
&gt;&gt; diff --git a/recipes-bsp/pru/pru-swuart-fw_git.bb b/recipes-bsp/pr=
u/pru-swuart-fw_git.bb<br>
&gt;&gt; index e22b3be..1cb51f3 100644<br>
&gt;&gt; --- a/recipes-bsp/pru/pru-swuart-fw_git.bb<br>
&gt;&gt; &#43;&#43;&#43; b/recipes-bsp/pru/pru-swuart-fw_git.bb<br>
&gt;&gt; @@ -8,20 &#43;8,20 @@ require recipes-ti/includes/ti-paths.inc<br>
&gt;&gt;&nbsp;&nbsp; COMPATIBLE_MACHINE =3D &quot;ti33x&quot;<br>
&gt;&gt;&nbsp;&nbsp; PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt; -# Below commit ID corresponds to &quot;DEV.UART_LLD.01.00.00.15&q=
uot;<br>
&gt;&gt; -SRCREV =3D &quot;4493f456549c85749a05b1f46bf0b75d23976db1&quot;<b=
r>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt; -PV =3D &quot;01.00.00.15&quot;<br>
&gt;&gt; &#43;inherit ti-pdk-fetch<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt; -BRANCH =3D &quot;master&quot;<br>
&gt;&gt; -SRC_URI =3D &quot;git://git.ti.com/keystone-rtos/uart-lld.git;pro=
tocol=3Dgit;branch=3D${BRANCH} \<br>
&gt;&gt; &#43;TI_PDK_COMP =3D &quot;ti.drv.uart&quot;<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;PE =3D &quot;1&quot;<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;SRC_URI_append =3D &quot; \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-icss_ua=
rt-add-Makefile-for-building-firmware.patch">
file://0001-icss_uart-add-Makefile-for-building-firmware.patch</a> \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-icss_ua=
rt-remove-dependency-on-PDK-CSL.patch">file://0001-icss_uart-remove-depende=
ncy-on-PDK-CSL.patch</a> \<br>
&gt;&gt;&nbsp;&nbsp; &quot;<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&nbsp;&nbsp; DEPENDS =3D &quot;ti-cgt-pru-native pru-icss&quot;<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&nbsp;&nbsp; export PRU_CGT =3D &quot;${TI_CGT_PRU_INSTALL_DIR}&quo=
t;<br>
&gt;&gt;&nbsp;&nbsp; export PRU_SSP =3D &quot;${STAGING_DIR_TARGET}/usr&quo=
t;<br>
&gt;&gt; -- <br>
&gt;&gt; 2.7.4<br>
&gt;&gt;<br>
&gt;&gt; -- <br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; meta-ti mailing list<br>
&gt;&gt; meta-ti@yoctoproject.org<br>
&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https:=
//lists.yoctoproject.org/listinfo/meta-ti</a><br>
</div>
</span></font>
</body>
</html>

--_000_c8cecb9d23444969baf3475caee7366eemailandroidcom_--
