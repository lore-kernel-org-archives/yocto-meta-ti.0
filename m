Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2974E00BE9; Mon, 25 Jan 2016 09:39:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, WEIRD_PORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.213.169 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A144E00AB9
	for <meta-ti@yoctoproject.org>; Mon, 25 Jan 2016 09:39:40 -0800 (PST)
Received: by mail-ig0-f169.google.com with SMTP id z14so40685413igp.1
	for <meta-ti@yoctoproject.org>; Mon, 25 Jan 2016 09:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=e/8bmI8ruB+o9SDuFZHXwevkJykpXMHEfhADbB3Vkp4=;
	b=rQnPwsbSjwI/bCseFOiwkYDUKkBvqLaj0Ne2bvrq8bnPcHcweOg3NwysYIQLR2YlzT
	phf8XR6Ltyc3QzlN7nzLrD//VEhFxxCvUdbfdTq1K4bwF6z8Qm+DK5k4+ze8hdSKLX02
	5KKn2QXeHljllYdAsAjA5bmn9HQSja07CcJOPssB4lW1xjrw3S6xaSeNE6+dPWCyIgyG
	9nX7z5+U4FhG8WnRtuhHh2CvOWU9HDbrVieDyB9z086k0kaZ9YrFHUopcBnNg71fd/UZ
	bcVf3heHfR3UG7h0D3gKGgJEIcEcQ6onFXzDpNunRRzCceaqSB9hYR7vRrtUd0J3cQEb
	6i7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=e/8bmI8ruB+o9SDuFZHXwevkJykpXMHEfhADbB3Vkp4=;
	b=gMRnt2vweiTxNMasFYn2WQhoMoAVDGIsynwdoKHUtAjv+3Azl2U0IYcDTO3iPYNn3C
	IY/gfBPAYVr7+wQE6UBvRehgLudo0833QUw4t7x2+Fhba45XE98qla1ZBTzrbUofug3s
	bbnsQjvF4zYnvHAvnw7w9FHijw/+dQc7ZE6xdcyU0maPchmxGimwu0K9I0OySP9gGpIC
	23KAB6FhBuLAg9nViPqMHXX9Zsm8AqWw7N7ymBMI8RY63BSrxjE9Cq+SQULaNTT9yKEw
	Oh+Bdwic5FaRkzBiSpd16figjp59CECyZClRPWbIUANkpTwewLOjz7QmZ2169VBcK8V7
	29cQ==
X-Gm-Message-State: AG10YORctdWy317uD3G0OhsxJ/rNfyE1T8OTSg1G0Z1wYBJdLtqSzD0v8emD0cEGpxWIiML2JNM0zw83gfhVOQ==
MIME-Version: 1.0
X-Received: by 10.50.171.200 with SMTP id aw8mr19649884igc.77.1453743579286;
	Mon, 25 Jan 2016 09:39:39 -0800 (PST)
Received: by 10.107.16.74 with HTTP; Mon, 25 Jan 2016 09:39:39 -0800 (PST)
Received: by 10.107.16.74 with HTTP; Mon, 25 Jan 2016 09:39:39 -0800 (PST)
In-Reply-To: <7A144FD2E22B42C29D1455BA473BACE1@RD3>
References: <7A144FD2E22B42C29D1455BA473BACE1@RD3>
Date: Mon, 25 Jan 2016 09:39:39 -0800
Message-ID: <CAMKF1spT+uLPxQJvRFjjTxtXN4crg34a4cQw=Q8TJ9iYLLZHCg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: winiston@futuraautomation.com
Cc: yocto texas <meta-ti@yoctoproject.org>
Subject: Re: Build Error for AM437x-evm
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jan 2016 17:39:45 -0000
Content-Type: multipart/alternative; boundary=089e010d9562a39b1f052a2c0d7a

--089e010d9562a39b1f052a2c0d7a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Always post your build configuration that bit bake spits out at the very
beginning of build
On Jan 25, 2016 1:28 AM, <winiston@futuraautomation.com> wrote:

> Dear ,
>
> I built default yocto image for qemux86 processor using poky. I used the =
bitbake
> core-image-minimal command to build the image. It has been built
> successfully.
> Now I made the following changes to build for AM437x evm.
>
> 1. Edited   ~/poky/build/conf/bblayers.conf   file as follows
>
> BBFILES ?=3D =E2=80=9C=E2=80=9D
> BBLAYERS =3D =E2=80=9C \
> /home/winiston/poky/meta \
> /home/winiston/poky/meta-yocto \
> /home/winiston/poky/meta-ti \
>
> Note :  meta-ti  resides in the poky folder.
>
> 2.Edited  ~/poky/build/conf/local.conf  file. The MACHINE variable
> changed from MACHINE ??=3D =E2=80=9Cqemux86=E2=80=9D  to  MACHINE ??=3D "=
am437x-evm"
>
> After making above two changes, I executed bitbake core-image-minimal
> command from terminal window. It gives the following error
>
> *ERROR: ParseError at
> /home/winiston/poky/meta-ti/recipes-graphics/drm/libdrm_2.4.41.bb:1
> <http://libdrm_2.4.41.bb:1>: Could not include required file
> recipes-graphics/drm/libdrm.inc*
>
> *Summary: There was 1 ERROR message shown, returning a non-zero exit code=
.*
> *winiston@winiston-VirtualBox:~/poky/build$
> <winiston@winiston-VirtualBox:~/poky/build$>*
>
> What could be the reason of this error? How do I solve this error?
>
> Regards,
> Winiston.P
> Futura Automation Pvt Ltd.
>
> Ph :91-80-28375290 / 28375295
> Fax :91-80-28375291
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>

--089e010d9562a39b1f052a2c0d7a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Always post your build configuration that bit bake spits out=
 at the very beginning of build</p>
<div class=3D"gmail_quote">On Jan 25, 2016 1:28 AM,  &lt;<a href=3D"mailto:=
winiston@futuraautomation.com">winiston@futuraautomation.com</a>&gt; wrote:=
<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div dir=3D"ltr">
<div dir=3D"ltr">
<div style=3D"FONT-SIZE:12pt;FONT-FAMILY:&#39;Calibri&#39;;COLOR:#000000">
<div>Dear ,</div>
<div>=C2=A0</div>
<div><font face=3D"Times New Roman">I built default yocto image for qemux86=
=20
processor using poky. I used the <font color=3D"#0000ff">bitbake=20
core-image-minimal</font> command to build the image. It has been built=20
successfully. </font></div>
<div><font face=3D"Times New Roman">Now I made the following changes to bui=
ld for=20
AM437x evm.</font></div>
<div><font face=3D"Times New Roman"></font>=C2=A0</div>
<div><font face=3D"Times New Roman">1. Edited=C2=A0=C2=A0 <font color=3D"#0=
000ff">~/poky/build/conf/bblayers.conf</font>=C2=A0=C2=A0 file as=20
follows</font></div>
<div><font face=3D"Times New Roman"></font>=C2=A0</div>
<div>BBFILES ?=3D =E2=80=9C=E2=80=9D</div>
<div>BBLAYERS =3D =E2=80=9C \</div>
<div>/home/winiston/poky/meta \</div>
<div>/home/winiston/poky/meta-yocto \</div>
<div><font color=3D"#0000ff">/home/winiston/poky/meta-ti \</font></div>
<div><font face=3D"Times New Roman"></font>=C2=A0</div>
<div><font face=3D"Times New Roman">Note :=C2=A0 <font color=3D"#0000ff">me=
ta-ti</font>=C2=A0 resides in the poky folder.</font></div>
<div><font face=3D"Times New Roman"></font>=C2=A0</div>
<div><font face=3D"Times New Roman">2.Edited </font>=C2=A0<font color=3D"#0=
000ff">~/poky/build/conf/local.conf=C2=A0 </font>file. The MACHINE=20
variable=C2=A0 changed from <font color=3D"#0000ff">MACHINE ??=3D=20
=E2=80=9Cqemux86=E2=80=9D</font>=C2=A0 to=C2=A0 <font color=3D"#0000ff">MAC=
HINE ??=3D=20
&quot;am437x-evm&quot;</font></div><font face=3D"Times New Roman"></font>
<div><br>After making above two changes, I executed <font face=3D"Times New=
 Roman"><font color=3D"#0000ff">bitbake core-image-minimal</font>=20
command from terminal window. It gives the following error</font></div>
<div><font face=3D"Times New Roman"></font>=C2=A0</div>
<div><strong><font color=3D"#0000ff">ERROR: ParseError at=20
/home/winiston/poky/meta-ti/recipes-graphics/drm/<a href=3D"http://libdrm_2=
.4.41.bb:1" target=3D"_blank">libdrm_2.4.41.bb:1</a>: Could not=20
include required file recipes-graphics/drm/libdrm.inc</font></strong></div>
<div><strong><font color=3D"#0000ff"></font></strong>=C2=A0</div>
<div><strong><font color=3D"#0000ff">Summary: There was 1 ERROR message sho=
wn,=20
returning a non-zero exit code.</font></strong></div>
<div><strong><font color=3D"#0000ff"><a href=3D"mailto:winiston@winiston-Vi=
rtualBox:~/poky/build$" target=3D"_blank">winiston@winiston-VirtualBox:~/po=
ky/build$</a></font></strong>=20
</div>
<div>=C2=A0</div>
<div><font color=3D"#ff0000">What could be the reason of this error? How do=
 I solve=20
this error?</font></div>
<div>=C2=A0</div>
<div style=3D"FONT-SIZE:12pt;FONT-FAMILY:&#39;Calibri&#39;;COLOR:#000000">R=
egards,<br>Winiston.P<br>Futura=20
Automation Pvt Ltd.<br><br>Ph :91-80-28375290 / 28375295<br>Fax=20
:91-80-28375291<br></div></div></div></div>
<br>--<br>
_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"noreferr=
er" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><b=
r>
<br></blockquote></div>

--089e010d9562a39b1f052a2c0d7a--
