Return-Path: <sergey.nikulov@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85723E00DF1; Wed, 24 Jul 2019 12:14:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, WEIRD_PORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (sergey.nikulov[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.171 listed in list.dnswl.org]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 459FFE00BAA;
	Wed, 24 Jul 2019 12:14:33 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id z28so45652435ljn.4;
	Wed, 24 Jul 2019 12:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=y3kkjAixHj6ubeOTBjL4Hzb6JC16kCKnBcdo34c4UAg=;
	b=JJH3jFXn/Jk4FO7/K3qbltfh7uYLADbEca3TmgMhbNeXPf0wYtmrcyJs1ZPZ+t09MI
	FAcgUWMr/r/NfI4bF05aZa92N2fklmf6dp4Z6usFc+atr7dQurBoGwDklUBsFk551s9e
	+Eyrd4DlXYVJHRDyXPCfxs0S7YBvGuZBAD3Up7OLPRJu4CnUpTiF6V8YoIZozk7nvP58
	pAZK1JX/7JehhwNCZX7pGLuBx8WStvmw5VGAUA/IvX7wvuuM1xrTlavC3BW6wMdxtvMl
	DWPgNSWla+XH15oo9KPs+ablWqcjO+x9WAJ23svy2C5aN5DhFlnRenONNc1MXwsz1KFJ
	nQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=y3kkjAixHj6ubeOTBjL4Hzb6JC16kCKnBcdo34c4UAg=;
	b=VQtAWOo31bgf9XuZFkJYFacwu1BnwHLcxw44KCxVIkvqWZ13bKKo7UIatHbOYmUVAA
	Xggrhj1h2Vi7zOkz1P0k1QjSGn2F1jiafg2gaDWuUn9aFwp4G/TgCwRqP5zkVgR04YR5
	kt3du6yS3yOcJh/Lc5OVclRwkan4XiVcVxR1LBGbxkLjCUMGc4hGLijrrabiZ3GeTLt8
	e1hEmQgxfKzHJYT33KKiXHc7lkN8qsD/52nOWU9RYCF1+7juZdyk0l9clWHFxLECcK2v
	EYmVse21ZtcYyXQkMenpl0NsaesJUgyQTyAnq+eTIIyCvJ2iI/1EAfqGWofoQgT+1Jli
	dzwQ==
X-Gm-Message-State: APjAAAX7AtHGt228EIxG/HDDnEtQFJU8YxsWyjEQO6h1SzKlaICY3pAo
	PhPbGL+I1Bh9EGJf6bJREnAW7ZBfR9JTAiXlM6+EEA==
X-Google-Smtp-Source: APXvYqwsTsmtGJl5n+O1kd7Qj25FvrP8bByWAFAEs/iE07QwvQ6sQC4yu4U+6AaU9h1++Cg/+CXUVRc23/hbQnaZ9tA=
X-Received: by 2002:a2e:b003:: with SMTP id y3mr44462918ljk.72.1563995672093; 
	Wed, 24 Jul 2019 12:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <em8e44e63f-388a-4ff6-ace9-d28ccd87f383@andys-imac.local>
In-Reply-To: <em8e44e63f-388a-4ff6-ace9-d28ccd87f383@andys-imac.local>
From: Sergei Nikulov <sergey.nikulov@gmail.com>
Date: Wed, 24 Jul 2019 22:14:21 +0300
Message-ID: <CAE7Ac0DuiLDgyP84DOmkXS+6P66evSysao=siy7LXP8_S2p1ug@mail.gmail.com>
To: Andy Pont <andy.pont@sdcsystems.com>
Cc: meta-ti@yoctoproject.org, Yocto-mailing-list <yocto@yoctoproject.org>
Subject: Re: Building for AM335x with meta-ti and meta-qt5
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
X-List-Received-Date: Wed, 24 Jul 2019 19:14:34 -0000
Content-Type: multipart/alternative; boundary="00000000000077290d058e721e8a"

--00000000000077290d058e721e8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

TI develops it's SDK based on Yocto here
http://arago-project.org/wiki/index.php/Main_Page

The latest master I'm able to use is Thud release.

HTH,
Sergei



=D1=81=D1=80, 24 =D0=B8=D1=8E=D0=BB. 2019 =D0=B3., 21:03 Andy Pont <andy.po=
nt@sdcsystems.com>:

> I am trying to build a Yocto (warrior) image for the AM335x using meta-ti
> and meta-qt5 that will render directly to the GPU.  Initially this will b=
e
> for the Beaglebone Black but then ultimately will be for a custom hardwar=
e
> platform.
>
> In broad outline, I think, the software stack needs to look a bit like:
>
> Qt Application
> QtBase, QtWebEngine, etc.
> Qt-OpenGL
> ti-sgx-ddk
> AM335x GPU
>
> I have included meta-ti and meta-qt5 into my belayers.conf and added
> ti-sgx-ddk-km, ti-sgx-ddk-um, qtbase and qtwebengine to
> IMAGE_INSTALL_append.  When I try to bitbake core-image-minimal I start t=
o
> get a failure to compile ti-sgx-ddk-km with a number of, what appear to b=
e,
> warnings of the form:
>
> KBUILD_EXTRA_SYMBOLS=3D
> | grep:
> /home/me/Yocto/BeagleBoneBlack/tmp/work-shared/beaglebone/kernel-source/i=
nclude/linux/amba:
> Is a directory
> | grep:
> /home/me/Yocto/BeagleBoneBlack/tmp/work-shared/beaglebone/kernel-source/i=
nclude/linux/avf:
> Is a directory
>
> It then ultimately appears to give up with:
>
> | ******* Multiarch build: no
> | ******* Primary arch:    target_armel
> | ******* Secondary arch:  none
> | ../config/core.mk:513: $(KERNELDIR)/vmlinux does not exist. Kbuild may
> fail.
> | eurasiacon/build/linux2/toplevel.mk:230:
> eurasiacon/build/linux2/moduledefs/target_armel.mk: No such file or
> directory
>
> Is there a specific kernel I need to define in local.conf that the GPU
> drivers build against?
>
> Also, is there any specific configuration I need to do in order to get Qt
> to use the SGX OpenGL drivers?
>
> I have had a search on the web but not found anything for recent Yocto
> versions, only very old stuff.
>
> -Andy.
>
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

--00000000000077290d058e721e8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>TI develops it&#39;s SDK based on Yocto here=C2=A0<a=
 href=3D"http://arago-project.org/wiki/index.php/Main_Page">http://arago-pr=
oject.org/wiki/index.php/Main_Page</a><div dir=3D"auto"><br></div><div dir=
=3D"auto">The latest master I&#39;m able to use is Thud release.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">HTH,</div><div dir=3D"auto">Sergei=
</div><div dir=3D"auto"><br></div><br><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">=D1=81=D1=80, 24 =D0=B8=D1=8E=D0=BB. 2019 =
=D0=B3., 21:03 Andy Pont &lt;<a href=3D"mailto:andy.pont@sdcsystems.com">an=
dy.pont@sdcsystems.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v class=3D"m_-6886942449771259551plain"><div>I am trying to build a Yocto (=
warrior) image for the AM335x using meta-ti and meta-qt5 that will render d=
irectly to the GPU.=C2=A0 Initially this will be for the Beaglebone Black b=
ut then ultimately will be for a custom hardware platform.</div><div><br></=
div><div>In broad outline, I think, the software stack needs to look a bit =
like:</div><div><br></div><div>Qt Application</div><div>QtBase, QtWebEngine=
, etc.</div><div>Qt-OpenGL</div><div>ti-sgx-ddk</div><div>AM335x GPU</div><=
div><br></div><div>I have included meta-ti and meta-qt5 into my belayers.co=
nf and added ti-sgx-ddk-km, ti-sgx-ddk-um, qtbase and qtwebengine to IMAGE_=
INSTALL_append.=C2=A0 When I try to bitbake core-image-minimal I start to g=
et a failure to compile ti-sgx-ddk-km with a number of, what appear to be, =
warnings of the form:</div><div><br></div><div>KBUILD_EXTRA_SYMBOLS=3D</div=
><div>| grep: /home/me/Yocto/BeagleBoneBlack/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/amba: Is a directory</div><div>| grep: /home/me/Yo=
cto/BeagleBoneBlack/tmp/work-shared/beaglebone/kernel-source/include/linux/=
avf: Is a directory</div><div><br></div><div>It then ultimately appears to =
give up with:</div><div><br></div><div>| ******* Multiarch build: no<br>| *=
****** Primary arch:=C2=A0 =C2=A0 target_armel<br>| ******* Secondary arch:=
=C2=A0 none<br>| ../config/<a href=3D"http://core.mk:513" target=3D"_blank"=
 rel=3D"noreferrer">core.mk:513</a>: $(KERNELDIR)/vmlinux does not exist. K=
build may fail.<br>| eurasiacon/build/linux2/<a href=3D"http://toplevel.mk:=
230" target=3D"_blank" rel=3D"noreferrer">toplevel.mk:230</a>: eurasiacon/b=
uild/linux2/moduledefs/<a href=3D"http://target_armel.mk" target=3D"_blank"=
 rel=3D"noreferrer">target_armel.mk</a>: No such file or directory</div><di=
v><br></div><div>Is there a specific kernel I need to define in local.conf =
that the GPU drivers build against?</div><div><br></div><div>Also, is there=
 any specific configuration I need to do in order to get Qt to use the SGX =
OpenGL drivers?</div><div><br></div><div>I have had a search on the web but=
 not found anything for recent Yocto versions, only very old stuff.</div><d=
iv><br></div><div>-Andy.</div><div><br></div><div><br></div>
</div>-- <br>
_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank" rel=3D"norefe=
rrer">meta-ti@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/me=
ta-ti</a><br>
</blockquote></div></div></div>

--00000000000077290d058e721e8a--
