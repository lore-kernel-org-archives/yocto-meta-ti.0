Return-Path: <kamaji@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 29752E00BA1; Tue, 24 May 2016 07:48:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (kamaji[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.49 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF647E00B5F
	for <meta-ti@yoctoproject.org>; Tue, 24 May 2016 07:48:12 -0700 (PDT)
Received: by mail-vk0-f49.google.com with SMTP id y2so24607164vka.3
	for <meta-ti@yoctoproject.org>; Tue, 24 May 2016 07:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=PuTygM/yJbWSHsixN4T6kPh9vjk2YUOE25hb/xR9B+8=;
	b=BKC5yadqpBifvfoY9evi6KIeV1AN4RHDN6zhCNxiIOeJJHg56Fhy3D3emJlydqz5vc
	8bm93UHwN6fqHicxx94xxjSeIUjCs0uHkLGWb7z4icJPY366RmWmVVTv9AkuoECxOk6V
	5KsZAm4LKWHBguFOjQuQ0Wut6KMdnULvSeaeWyS8cSY6d7EsCkFxLvbmdLGPP7kS7Khi
	+gDBzHLLKg3CJegGCPGllu6G+EXqlPVLNgR21+U0VSQzaZgxO+m8R4qHaX3Fbrhr/fpP
	Jhhfji2sz815Rnydc//RHqgpELgptsaKXhy4pp/zIpv1dpl4bDvavH5lN2rn3bJ9RnDH
	YiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=PuTygM/yJbWSHsixN4T6kPh9vjk2YUOE25hb/xR9B+8=;
	b=SyP1QrzytqIs1ldmFV3PdWYZSgg0F3QmJbISMpA81oORBjcHOmR4T8YP1k5KdGuD/Y
	A8ypUDxsyBGpg6FVkTbb6eqNI7cGrjOepMRss/V5vCOMKPXB/iF3Oqzf6fySOf89FX4p
	Uf3sHBhjiCcgBwpt88pElO/d+FwMdF+IkNbj1S6C54sL17cU5LrMV6EcuXZ6SND75iMh
	YHl2t0fjBEGeqA3XeIDSGDyBdUoQoYqASh0G922ulDqoyy3u32y2OLEELhZ0p5GoxN3y
	s+4w1PhQZRIQ8Q/2lp0e918CVV673JCyd4HBgKc2A1SfbEWVmpjPBLSqNJxf4ex0PvsE
	xWBw==
X-Gm-Message-State: ALyK8tK58WAN4AZfVT3BR26ew16qS9JOntVYucwfw9McLl6VbQE5E2S/mLOF7HIF4psJUR4Sb5VW7oP1wtTgVw==
X-Received: by 10.176.0.21 with SMTP id 21mr2640274uai.87.1464101291520; Tue,
	24 May 2016 07:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAH5ySac1VscW4vszpXbj4zw5vDZhCovVyxtnLKn59k=8JjVp5Q@mail.gmail.com>
In-Reply-To: <CAH5ySac1VscW4vszpXbj4zw5vDZhCovVyxtnLKn59k=8JjVp5Q@mail.gmail.com>
From: Keith Kyzivat <kamaji@gmail.com>
Date: Tue, 24 May 2016 14:48:01 +0000
Message-ID: <CAH5ySaex5z7G1rKpkXgpnOMnPkFYkL3xQrTp3ZWOcg0jqU_0wQ@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Re: Rename of omap5-sgx-ddk-um-linux to ti-sgx-ddk-um not complete?
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
X-List-Received-Date: Tue, 24 May 2016 14:48:19 -0000
Content-Type: multipart/alternative; boundary=001a113d0a72657a40053397a59a

--001a113d0a72657a40053397a59a
Content-Type: text/plain; charset=UTF-8

Hi Denys,

I'm working with the Beaglebone Black Rev C board -- so AM335x-based.
What incantation/recipe/package should I be specifying to get the userspace
DRI drivers for use with libGLESv2 built into my image? That's been my
biggest stumbling block.  Even moving back to Fido I was unable to build an
image that includes the userspace graphics support libraries.

Ultimately I want to pull in Qt 5.6 and be able to run QML-based apps with
the 'eglfs' QPA platform plugin with hardware OpenGLES2 acceleration
running over HDMI.

Are there any good resources ((e)books, wikis, presentations, etc)  you or
anyone else can recommend to fully grasp Yocto/OpenEmbedded?  I've come
across a number of presentations, wikis and blog posts that have explained
some things, but no comprehensive walkthrough that performs a build and
explains all the reasons for the changes.

~Keith

On Thu, May 19, 2016 at 7:41 PM Keith Kyzivat <kamaji@gmail.com> wrote:

> Hi folks,
>
> I've been trying to get a beagleboard krogoth build working with working
> OpenGLES2 DRI drivers in place, and have been failing.
>
> I did find out that drivers changed name from libgles-omap3 to
> ti-sgx-ddk-um - but specifying ti-sgx-ddk-um as my
> PREFERRED_PROVIDER_virtual/libgles2 fails hard --
>  -- Nothing RPROVIDES 'ti-sgx-ddk-um'
>
> Digging through commits, I found commit c70102c671 -
> renaming omap5-sgx-ddk-um-linux to ti-sgx-ddk-um.
>
> The problem seems to be that these are renamed, but the package names have
> not changed -- recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> includes:
>
> PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2
> omap5-sgx-ddk-um-linux"
>
> Shouldn't this be the following?
> PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 ti-sgx-ddk-um"
>
> And also RPROVIDES, RREPLACES, RCONFLICTS and associated -dev, -dbg
> packages?
>
> Apologies if I'm asking this wrong - I'm pretty new to Yocto/OE and still
> figuring it all out.
>
> ~Keith Kyzivat
>

--001a113d0a72657a40053397a59a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Denys,<div><br></div><div>I&#39;m working with the Beag=
lebone Black Rev C board -- so AM335x-based.</div><div>What incantation/rec=
ipe/package should I be specifying to get the userspace DRI drivers for use=
 with libGLESv2 built into my image? That&#39;s been my biggest stumbling b=
lock.=C2=A0 Even moving back to Fido I was unable to build an image that in=
cludes the userspace graphics support libraries.</div><div><br></div><div>U=
ltimately I want to pull in Qt 5.6 and be able to run QML-based apps with t=
he &#39;eglfs&#39; QPA platform plugin with hardware OpenGLES2 acceleration=
 running over HDMI.</div><div><br></div><div>Are there any good resources (=
(e)books, wikis, presentations, etc) =C2=A0you or anyone else can recommend=
 to fully grasp Yocto/OpenEmbedded?=C2=A0 I&#39;ve come across a number of =
presentations, wikis and blog posts that have explained some things, but no=
 comprehensive walkthrough that performs a build and explains all the reaso=
ns for the changes.</div><div><br></div><div>~Keith</div><div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr">On Thu, May 19, 2016 at 7:41 PM Keith Ky=
zivat &lt;<a href=3D"mailto:kamaji@gmail.com">kamaji@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi folks,<div><=
br></div><div>I&#39;ve been trying to get a beagleboard krogoth build worki=
ng with working OpenGLES2 DRI drivers in place, and have been failing.</div=
><div><br></div><div>I did find out that drivers changed name from libgles-=
omap3 to ti-sgx-ddk-um - but specifying=C2=A0ti-sgx-ddk-um as my PREFERRED_=
PROVIDER_virtual/libgles2 fails hard --</div><div>=C2=A0-- Nothing RPROVIDE=
S &#39;ti-sgx-ddk-um&#39;</div><div><br></div><div>Digging through commits,=
 I found commit c70102c671 - renaming=C2=A0omap5-sgx-ddk-um-linux to=C2=A0t=
i-sgx-ddk-um.</div><div><br></div><div>The problem seems to be that these a=
re renamed, but the package names have not changed --=C2=A0recipes-graphics=
/libgles/<a href=3D"http://ti-sgx-ddk-um_1.14.3699939.bb" target=3D"_blank"=
>ti-sgx-ddk-um_1.14.3699939.bb</a> includes:</div><div><br></div><div>PROVI=
DES +=3D &quot;virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-=
um-linux&quot;<br></div><div><br></div><div>Shouldn&#39;t this be the follo=
wing?</div><div>PROVIDES +=3D &quot;virtual/egl virtual/libgles1 virtual/li=
bgles2 ti-sgx-ddk-um&quot;</div><div><br></div><div>And also=C2=A0RPROVIDES=
, RREPLACES, RCONFLICTS and associated -dev, -dbg packages?</div><div><br><=
/div><div>Apologies if I&#39;m asking this wrong - I&#39;m pretty new to Yo=
cto/OE and still figuring it all out.</div></div><div dir=3D"ltr"><div><br>=
</div><div>~Keith Kyzivat</div></div></blockquote></div></div></div>

--001a113d0a72657a40053397a59a--
