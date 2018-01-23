Return-Path: <adam.yh.lee@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8FA0FE00DD7; Tue, 23 Jan 2018 10:35:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.170 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (adam.yh.lee[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 619D6E0085E
	for <meta-ti@yoctoproject.org>; Tue, 23 Jan 2018 10:35:01 -0800 (PST)
Received: by mail-yw0-f170.google.com with SMTP id u21so553270ywc.2
	for <meta-ti@yoctoproject.org>; Tue, 23 Jan 2018 10:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZEHJYycb8OxX5FL/4Dxn1HnkbrOFlx2KAYw4GG89b+4=;
	b=HIAZeQjA9ZUiw3TikmiQj49Lt1sXnyYfYGa8kZGtb0oxA3p9BoUESWKes0023PqXN8
	kVnFfHBwOYfT2DKQOIDcwI//S862oryR3woMBHAxjQHw8/yMNLUO7/AxCbVwjpDc7WsC
	dN6sIEatcLEOsybzElR2wRx9FQ5g6K44RVgdiRfLVRmFtKlyGYG8BDjdHyFMZKCZyHPc
	qgCDi4PTEqEYql2x59iiw82TClhXN2lJEPfllZf0HOcrDn82DAqvaG+rkEnHA1+UaVda
	fdP1RoFf+dlj+ldxX35aoZnaHRyeT5Z3FZx485SU9JQP5Byo+MLDSVjFbqMzjUAvAaYa
	HX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZEHJYycb8OxX5FL/4Dxn1HnkbrOFlx2KAYw4GG89b+4=;
	b=ss1miM8/z84V8226wS91KaGmNXOa8j/2FGKUr2t72WMmlVNZicfYMlzCRXo51PzXLA
	/oJMYewcTGsKFIPqoDDQs+C6VjUA8qlr+mCsf3sUhqk7/26zwpCmmlvoJ0gT7Uzb6yEl
	QSgZUzksYYQcLZuq+fKvtPqpOmUUuxdlvP80uzMDdrUl6d4TMs/JGVequ6QL2abpEAN4
	G4CzxWesOnOmi03ggNxD2GF3unfR+Njp2DNqe0HDgzoVwVyQ+rM8Pi0pRvb1RK+ef2Or
	nL0ra5h+eyqaMMiSEyY2I/miav2Unw/9s02lYJ4uNydiNcYEO+FCCOP4+yQ/L39AAAmw
	0xnw==
X-Gm-Message-State: AKwxytcpa/GcLIupZ6qdWE2f4zuoec+PVApPhR8R2dlh/kCPxDveVk3O
	FKOdlCRTi/i14i9O/8NvBDM4Ax9SKOFRn9Oj+5g=
X-Google-Smtp-Source: AH8x225kDpUyPQL7RPjZks1v+AGHDTNmjjaGeerUj56oGaY1Q9+gYvaPQGf/7K8VooCjSNoY6q+A1PojLnfACZd/nrI=
X-Received: by 10.129.138.197 with SMTP id a188mr3369666ywg.88.1516732500566; 
	Tue, 23 Jan 2018 10:35:00 -0800 (PST)
MIME-Version: 1.0
References: <CAFeBWL6siZyknfmD6PXrkwt6DA=7e6anK+0NBuwOBJRgVbOoEw@mail.gmail.com>
	<20180112205241.GM25785@edge>
In-Reply-To: <20180112205241.GM25785@edge>
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Tue, 23 Jan 2018 18:34:50 +0000
Message-ID: <CAFeBWL7LVoLyKf8KnSBo1iqui42b1Ho89HRJ7tCd1Pjmf7Gg=A@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Extensible SDK with TI SDK?
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
X-List-Received-Date: Tue, 23 Jan 2018 18:35:02 -0000
Content-Type: multipart/alternative; boundary="94eb2c080808ea69b0056375cd26"

--94eb2c080808ea69b0056375cd26
Content-Type: text/plain; charset="UTF-8"

Thanks for clarifying this Denys.

Adam

On Fri, Jan 12, 2018 at 3:52 PM Denys Dmytriyenko <denys@ti.com> wrote:

> Adam,
>
> meta-ti is a pure BSP layer and has absolutely no knowledge of
> tisdk-rootfs-image.
> That means that meta-ti itself shouldn't have any issues with Yocto
> Extensible
> SDK.
>
> Now, TI SDK specifically is covered by meta-arago, which is a separate
> layer
> with its own list, and does not currently support extensible SDK.
>
> --
> Denys
>
>
> On Fri, Jan 12, 2018 at 06:18:32PM +0000, Adam Lee wrote:
> > Has anyone successfully built Yocto's Extensible SDK with meta-ti
> included?
> > I am getting this error on the latest version:
> >
> > ERROR: tisdk-rootfs-image-1.0-r0 do_populate_sdk_ext: Error executing a
> > python function in exec_python_func() autogenerated:
> >
> > The stack trace of python calls that resulted in this exception/failure
> was:
> > File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
> >      0001:
> >  *** 0002:copy_buildsystem(d)
> >      0003:
> > File:
> '/home/tisdk/sources/oe-core/meta/classes/populate_sdk_ext.bbclass',
> > lineno: 331, function: copy_buildsystem
> >      0327:            f.write('TCLIBCAPPEND = ""\n')
> >      0328:            f.write('DL_DIR = "${TOPDIR}/downloads"\n')
> >      0329:
> >      0330:            f.write('INHERIT += "%s"\n' % 'uninative')
> >  *** 0331:            f.write('UNINATIVE_CHECKSUM[%s] = "%s"\n\n' %
> > (d.getVar('BUILD_ARCH'), uninative_checksum))
> >      0332:            f.write('CONF_VERSION = "%s"\n\n' %
> > d.getVar('CONF_VERSION', False))
> >      0333:
> >      0334:            # Some classes are not suitable for SDK, remove
> them
> > from INHERIT
> >      0335:            f.write('INHERIT_remove = "%s"\n' %
> > d.getVar('SDK_INHERIT_BLACKLIST', False))
> > Exception: UnboundLocalError: local variable 'uninative_checksum'
> > referenced before assignment
> >
> > ERROR: tisdk-rootfs-image-1.0-r0 do_populate_sdk_ext: Function failed:
> > copy_buildsystem
> > ERROR: Logfile of failure stored in:
> >
> /home/tisdk/build/arago-tmp-glibc/work/am57xx_evm-oe-linux-gnueabi/tisdk-rootfs-image/1.0-r0/temp/log.do_populate_sdk_ext.42114
> > ERROR: Task
> >
> (/home/tisdk/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb:
> do_populate_sdk_ext)
> > failed with exit code '1'
> >
> > Regards,
> >
> > Adam
>
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>
>

--94eb2c080808ea69b0056375cd26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for clarifying this Denys.<div><br></div><div>Adam<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Jan 12, =
2018 at 3:52 PM Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys=
@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Adam,<br>
<br>
meta-ti is a pure BSP layer and has absolutely no knowledge of tisdk-rootfs=
-image.<br>
That means that meta-ti itself shouldn&#39;t have any issues with Yocto Ext=
ensible<br>
SDK.<br>
<br>
Now, TI SDK specifically is covered by meta-arago, which is a separate laye=
r<br>
with its own list, and does not currently support extensible SDK.<br>
<br>
--<br>
Denys<br>
<br>
<br>
On Fri, Jan 12, 2018 at 06:18:32PM +0000, Adam Lee wrote:<br>
&gt; Has anyone successfully built Yocto&#39;s Extensible SDK with meta-ti =
included?<br>
&gt; I am getting this error on the latest version:<br>
&gt;<br>
&gt; ERROR: tisdk-rootfs-image-1.0-r0 do_populate_sdk_ext: Error executing =
a<br>
&gt; python function in exec_python_func() autogenerated:<br>
&gt;<br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;exec_python_func() autogenerated&#39;, lineno: 2, function:=
 &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:<br>
&gt;=C2=A0 *** 0002:copy_buildsystem(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0003:<br>
&gt; File: &#39;/home/tisdk/sources/oe-core/meta/classes/populate_sdk_ext.b=
bclass&#39;,<br>
&gt; lineno: 331, function: copy_buildsystem<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0327:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.w=
rite(&#39;TCLIBCAPPEND =3D &quot;&quot;\n&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0328:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.w=
rite(&#39;DL_DIR =3D &quot;${TOPDIR}/downloads&quot;\n&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0329:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0330:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.w=
rite(&#39;INHERIT +=3D &quot;%s&quot;\n&#39; % &#39;uninative&#39;)<br>
&gt;=C2=A0 *** 0331:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;=
UNINATIVE_CHECKSUM[%s] =3D &quot;%s&quot;\n\n&#39; %<br>
&gt; (d.getVar(&#39;BUILD_ARCH&#39;), uninative_checksum))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0332:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.w=
rite(&#39;CONF_VERSION =3D &quot;%s&quot;\n\n&#39; %<br>
&gt; d.getVar(&#39;CONF_VERSION&#39;, False))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0333:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0334:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # S=
ome classes are not suitable for SDK, remove them<br>
&gt; from INHERIT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0335:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.w=
rite(&#39;INHERIT_remove =3D &quot;%s&quot;\n&#39; %<br>
&gt; d.getVar(&#39;SDK_INHERIT_BLACKLIST&#39;, False))<br>
&gt; Exception: UnboundLocalError: local variable &#39;uninative_checksum&#=
39;<br>
&gt; referenced before assignment<br>
&gt;<br>
&gt; ERROR: tisdk-rootfs-image-1.0-r0 do_populate_sdk_ext: Function failed:=
<br>
&gt; copy_buildsystem<br>
&gt; ERROR: Logfile of failure stored in:<br>
&gt; /home/tisdk/build/arago-tmp-glibc/work/am57xx_evm-oe-linux-gnueabi/tis=
dk-rootfs-image/1.0-r0/temp/log.do_populate_sdk_ext.42114<br>
&gt; ERROR: Task<br>
&gt; (/home/tisdk/sources/meta-arago/meta-arago-distro/recipes-core/images/=
tisdk-rootfs-image.bb:do_populate_sdk_ext)<br>
&gt; failed with exit code &#39;1&#39;<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; Adam<br>
<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti@=
yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti<=
/a><br>
<br>
</blockquote></div>

--94eb2c080808ea69b0056375cd26--
