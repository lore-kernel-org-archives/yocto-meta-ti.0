Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C767EE012F0
	for <meta-ti@yoctoproject.org>; Sat, 19 Oct 2013 11:53:23 -0700 (PDT)
Received: by mail-ee0-f49.google.com with SMTP id d41so2724960eek.36
	for <meta-ti@yoctoproject.org>; Sat, 19 Oct 2013 11:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SCPxgJwml2MZZmHVU4ZGilSy1rmVvUk++d+XUpNAk34=;
	b=gKKbXBDxWwUEye6/Q4r4F2k8V/dtuoyg33z4+fv09MywtiECjHixPK4oPSVOoy6pOz
	RHAoybKMYrfQOfO8Ep99lPeGJceTe1FPdOoEv17JAbrg3o5pYVx7+fufRjOvmC+FPT+8
	4dKrfYB6cakdU1F4DmRNav04gbcD72ZcSWKho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=SCPxgJwml2MZZmHVU4ZGilSy1rmVvUk++d+XUpNAk34=;
	b=eyJN+OjbaWj+azREWBwGXtPiAS0TakaQYHGv8BpYocAn7nhLXu1Xw4dxcKpY1ap9Rc
	P4LGo828LC9SxqsRuW0EPyd1nw4MFvg9I74kFe5SgAWH81wAKwrSDgLP1I34MLoBbyRc
	5mPuTNRk6uJ23VcSBL2voKe8aAcnOcADhuPp1es3U/2rkWoXHpJxx2XqskXalH9lMFZo
	t9Vx/XWo+ENRNK97AFsIw4B9lIBgZO78rfkgW/xjQwsxc6o0HZV0/Xoh3QoGwlAZjCfd
	b1FGaEjf/4iwSERPW1ZUTLKdklHrYLq/Xebq4k/7Pe54+D6rhBsVi614fKVXzNuXoSG3
	L2hg==
X-Gm-Message-State: ALoCoQkIJXpWIQJMBgksP/uxCr9cjLDjET+OcleA5s3DshrQrDvXNhU6M9NqUJ9FmlY0uLkpZOuw
MIME-Version: 1.0
X-Received: by 10.15.77.132 with SMTP id p4mr816971eey.95.1382208802280; Sat,
	19 Oct 2013 11:53:22 -0700 (PDT)
Received: by 10.223.147.133 with HTTP; Sat, 19 Oct 2013 11:53:22 -0700 (PDT)
In-Reply-To: <20131019023954.GK2127@edge>
References: <CA+gsK-p49VYtzviOwgtzssxxXnAS4Eku0Y95bsFL5LvT+v=9Sw@mail.gmail.com>
	<20131017214528.GC30989@edge>
	<CA+gsK-qKLdXTq1PJEmXLp0d5n5wEYf+6Na+pFj+UwnWLO_dt2g@mail.gmail.com>
	<20131019023954.GK2127@edge>
Date: Sat, 19 Oct 2013 11:53:22 -0700
Message-ID: <CA+gsK-q8W-wAP-rBhy7RgHUddsbdE_SaNOgyfFQ+zj2ksSidKw@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: AM335x EVM and core-image-sato
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
X-List-Received-Date: Sat, 19 Oct 2013 18:53:26 -0000
Content-Type: multipart/alternative; boundary=001a11c326aeaa695d04e91c9050

--001a11c326aeaa695d04e91c9050
Content-Type: text/plain; charset=ISO-8859-1

Thanks, Denys.


Have you tried the latest update to 3.12-rc5? That combination seems to be
> building and booting fine, according to our automated reports:
>
> http://article.gmane.org/gmane.linux.embedded.yocto.meta-arago/1245
>
> Yes, I tried 3.12-rc3 which worked, 3.12-rc4 which did not, as well as
3.12-rc5 which does not work either.



>
> > One step forward, two steps back. Pulled again, and this time build fails
> > because branch ti-linux-312.y is not available
> The branch was and is called ti-linux-3.12.y and it hasn't changed since
> the
> beginning of 3.12 integration and is still there:
>
>
> http://git.ti.com/gitweb/?p=ti-linux-kernel/ti-linux-kernel.git;a=shortlog;h=refs/heads/ti-linux-3.12.y
>
>
> Fetcher failed on it during the day yesterday. But it worked again at
night. Maybe a glitch. Although the Gitorious web frontend responds with an
error message when trying to explore the branch tree.


>  If you want to use meta-ti master,
> then the corresponding commit ID is
> c11504664990f007c3903d349e7cc135a904f8e2.
>
>  I used the master branch and the exact commit you mentioned above. See
[1]. I will try again.

Thanks,
Rudi



[1]
Build Configuration:
BB_VERSION        = "1.21.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Fedora-18"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "am335x-evm"
DISTRO            = "poky"
DISTRO_VERSION    = "1.5+snapshot-20131019"
TUNE_FEATURES     = "armv7a vfp neon"
TARGET_FPU        = "vfp-neon"
meta-yocto        = "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
meta-ti           = "master:c11504664990f007c3903d349e7cc135a904f8e2"
meta-oe           = "master:f8903f53db717294d63a8d79b5ef7ca34b3c189e"
meta              = "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"

--001a11c326aeaa695d04e91c9050
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, Denys.<div class=3D"gmail_extra"><br><br><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex">
Have you tried the latest update to 3.12-rc5? That combination seems to be<=
br>
building and booting fine, according to our automated reports:<br>
<br>
<a href=3D"http://article.gmane.org/gmane.linux.embedded.yocto.meta-arago/1=
245" target=3D"_blank">http://article.gmane.org/gmane.linux.embedded.yocto.=
meta-arago/1245</a><br>
<div class=3D"im"><br></div></blockquote><div>Yes, I tried 3.12-rc3 which w=
orked, 3.12-rc4 which did not, as well as 3.12-rc5 which does not work eith=
er.</div><div><br></div><div>=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(=
204,204,204);border-left-style:solid;padding-left:1ex">
<div class=3D"im">
<br>
&gt; One step forward, two steps back. Pulled again, and this time build fa=
ils<br>
&gt; because branch ti-linux-312.y is not available<br>
</div>The branch was and is called ti-linux-3.12.y and it hasn&#39;t change=
d since the<br>
beginning of 3.12 integration and is still there:<br>
<br>
<a href=3D"http://git.ti.com/gitweb/?p=3Dti-linux-kernel/ti-linux-kernel.gi=
t;a=3Dshortlog;h=3Drefs/heads/ti-linux-3.12.y" target=3D"_blank">http://git=
.ti.com/gitweb/?p=3Dti-linux-kernel/ti-linux-kernel.git;a=3Dshortlog;h=3Dre=
fs/heads/ti-linux-3.12.y</a><br>

<div class=3D"im"><br>
<br></div></blockquote><div>Fetcher failed on it during the day yesterday. =
But it worked again at night. Maybe a glitch. Although the Gitorious web fr=
ontend responds with an error message when trying to explore the branch tre=
e.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div class=3D"im"><span style=3D"color:rgb(3=
4,34,34)">=A0If you want to use meta-ti master,</span><br>
</div>
then the corresponding commit ID is c11504664990f007c3903d349e7cc135a904f8e=
2.<br>
<span class=3D""><font color=3D"#888888"><br></font></span></blockquote><di=
v>=A0I used the master branch and the exact commit you mentioned above. See=
 [1]. I will try again.</div><div><br></div><div>Thanks,</div><div>Rudi</di=
v>
<div><br></div><div><br></div><div><br></div><div>[1]</div><div><div>Build =
Configuration:</div><div>BB_VERSION =A0 =A0 =A0 =A0=3D &quot;1.21.0&quot;</=
div><div>BUILD_SYS =A0 =A0 =A0 =A0 =3D &quot;x86_64-linux&quot;</div><div>N=
ATIVELSBSTRING =A0 =3D &quot;Fedora-18&quot;</div>
<div>TARGET_SYS =A0 =A0 =A0 =A0=3D &quot;arm-poky-linux-gnueabi&quot;</div>=
<div>MACHINE =A0 =A0 =A0 =A0 =A0 =3D &quot;am335x-evm&quot;</div><div>DISTR=
O =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;poky&quot;</div><div>DISTRO_VERSION =A0 =
=A0=3D &quot;1.5+snapshot-20131019&quot;</div>
<div>TUNE_FEATURES =A0 =A0 =3D &quot;armv7a vfp neon&quot;</div><div>TARGET=
_FPU =A0 =A0 =A0 =A0=3D &quot;vfp-neon&quot;</div><div>meta-yocto =A0 =A0 =
=A0 =A0=3D &quot;master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4&quot;</div=
><div>meta-ti =A0 =A0 =A0 =A0 =A0 =3D &quot;master:c11504664990f007c3903d34=
9e7cc135a904f8e2&quot;</div>
<div>meta-oe =A0 =A0 =A0 =A0 =A0 =3D &quot;master:f8903f53db717294d63a8d79b=
5ef7ca34b3c189e&quot;</div><div>meta =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;m=
aster:9a1dce10bdc9254bb38e0e54199f23ae55e209a4&quot; =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div>
</div></div>
</div></div>

--001a11c326aeaa695d04e91c9050--
