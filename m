Return-Path: <deepakvijay2255@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EFA9DE00BF4; Mon, 19 May 2014 05:04:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.215.48 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 302 seconds by postgrey-1.32 at yocto-www;
	Mon, 19 May 2014 05:04:03 PDT
Received: from mail-la0-f48.google.com (unknown [209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5EFD5E00BFD
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 05:04:03 -0700 (PDT)
Received: by mail-la0-f48.google.com with SMTP id mc6so3936685lab.21
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 05:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=YNhpLcqco9/z0nkIC07QPFPZ7kLemqe+YYNcgdt1kGQ=;
	b=Jhlh6FAwJIsZ3YHpfffVcJEzPiYxSkYn59Hzx4aEdVXHBQ/Sul5lMF7bQDp4xV2Q6x
	RxssuDaNic7ddQ7xS4IdPPdpsCK1TjeeLngqGoZei/DimAJoxvxf3V7GEtA8M+N6TTD9
	7MZIeyyb3iHcWQ552IxzoQ3lpI1S+L+PbYaRSRnX024GS+axLVnDm7XV3EvNEbl2M4B6
	EEjPxmZyRYspmyDhmv37cgDlpUiMHyTrAAZMsTPp89e95zemPVxL5+HfnIIGHCAFTvwR
	vcjods7TxfJV4tm/KVldGikXvB0Dskmyyfz1LK+LDTOvogmqDUNsodEccNAdHDgXgz5q
	1s9w==
MIME-Version: 1.0
X-Received: by 10.112.122.109 with SMTP id lr13mr1242469lbb.82.1400500739359; 
	Mon, 19 May 2014 04:58:59 -0700 (PDT)
Sender: deepakvijay2255@gmail.com
Received: by 10.112.159.132 with HTTP; Mon, 19 May 2014 04:58:59 -0700 (PDT)
In-Reply-To: <20140516174509.GB18053@edge>
References: <CAAxuRXhiK2cce86W7wWrahrOC=jaAqyVXaU_KCFwg2cQqJR0NQ@mail.gmail.com>
	<20140516174509.GB18053@edge>
Date: Mon, 19 May 2014 17:28:59 +0530
X-Google-Sender-Auth: LsIINxj0Og5kdnaAClbHjEHu4yk
Message-ID: <CAAxuRXjVQfMfiVSc=0aG3Px75Ab0YYOd-gZd4DO8kQwrk8cNEQ@mail.gmail.com>
From: deepak vijay <deepakvijay2255@rediff.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: boot fail in omap3 evm
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
X-List-Received-Date: Mon, 19 May 2014 12:04:39 -0000
Content-Type: multipart/alternative; boundary=047d7beba13a13c71204f9bf7d74

--047d7beba13a13c71204f9bf7d74
Content-Type: text/plain; charset=UTF-8

Hi Denys,
I tried the lower version of yocto (1.2 denzil) but it was its not
supporting the meta-ti layer which contains omap3evm support. It was
throwing some un known error and os incompatibility error also. So I
dropped  the idea of using lower versions.
So I was planing to move to next suggested option and I find out that only
2.6.x kernel recipe (linux-omap_2.6.37.bb) support omap3evm. Not the higher
versions.
Please help me to resolve this problem.
How to add support for omap3evm to the higher kernel recipes in meta-ti
layer.

All the responses are appreciated.

Regards,
Deepak


On Fri, May 16, 2014 at 11:15 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Fri, May 16, 2014 at 12:33:31PM +0530, deepak vijay wrote:
> > Hi all,
> > I am new to yocto project .
> > I have downloaded the beaglebone-daisy-11.0.0 and add meta-ti layer
> whith a
> > commit id of 4e5bcb5712bf2f0587ceff908d75177e410de48f.
> > And when I build it for omap3evm and boot the images of the build I am
> > getting the following dump logs when I enable earlyprintk without
> changing
> > any other configurations.
> >
> > And one of the member suggested me that use lower version of gcc like gcc
> > 4.3. But I didn't find any way to use it. Because only gcc 4.8.2 recipe
> is
> > there in the layer.
>
> You can grab one of the older Yocto releases, e.g. 1.2 denzil has gcc-4.6
> Otherwise there were/are some layers still with gcc-4.5 support, at least
> in
> the external toolchain form...
>
> On the other hand, may I ask why do you want to build such an old kernel
> with
> the latest Yocto setup and the toolchain? Can you just use one of the
> recent
> 3.x kernels?
>
> --
> Denys
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

--047d7beba13a13c71204f9bf7d74
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Denys,<div>I tried the lower version of yocto (1.2 denz=
il) but it was its not supporting the meta-ti layer which contains omap3evm=
 support. It was throwing some un known error and os incompatibility error =
also. So I dropped =C2=A0the idea of using lower versions.=C2=A0</div>
<div>So I was planing to move to next suggested option and I find out that =
only 2.6.x kernel recipe (<a href=3D"http://linux-omap_2.6.37.bb">linux-oma=
p_2.6.37.bb</a>) support omap3evm. Not the higher versions.</div><div>Pleas=
e help me to resolve this problem.</div>
<div>How to add support for omap3evm to the higher kernel recipes in meta-t=
i layer.=C2=A0</div><div><br></div><div>All the responses are appreciated.<=
/div><div><br></div><div>Regards,</div><div>Deepak=C2=A0</div></div><div cl=
ass=3D"gmail_extra">
<br><br><div class=3D"gmail_quote">On Fri, May 16, 2014 at 11:15 PM, Denys =
Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D=
"_blank">denys@ti.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<div class=3D"">On Fri, May 16, 2014 at 12:33:31PM +0530, deepak vijay wrot=
e:<br>
&gt; Hi all,<br>
&gt; I am new to yocto project .<br>
&gt; I have downloaded the beaglebone-daisy-11.0.0 and add meta-ti layer wh=
ith a<br>
&gt; commit id of 4e5bcb5712bf2f0587ceff908d75177e410de48f.<br>
&gt; And when I build it for omap3evm and boot the images of the build I am=
<br>
&gt; getting the following dump logs when I enable earlyprintk without chan=
ging<br>
&gt; any other configurations.<br>
&gt;<br>
</div><div class=3D"">&gt; And one of the member suggested me that use lowe=
r version of gcc like gcc<br>
&gt; 4.3. But I didn&#39;t find any way to use it. Because only gcc 4.8.2 r=
ecipe is<br>
&gt; there in the layer.<br>
<br>
</div>You can grab one of the older Yocto releases, e.g. 1.2 denzil has gcc=
-4.6<br>
Otherwise there were/are some layers still with gcc-4.5 support, at least i=
n<br>
the external toolchain form...<br>
<br>
On the other hand, may I ask why do you want to build such an old kernel wi=
th<br>
the latest Yocto setup and the toolchain? Can you just use one of the recen=
t<br>
3.x kernels?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
--<br>
_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
</font></span></blockquote></div><br></div>

--047d7beba13a13c71204f9bf7d74--
