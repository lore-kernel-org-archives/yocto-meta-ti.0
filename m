Return-Path: <adam.yh.lee@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA92AE00DEE; Mon, 12 Feb 2018 08:04:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (adam.yh.lee[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7F485E00D1C
	for <meta-ti@yoctoproject.org>; Mon, 12 Feb 2018 08:04:06 -0800 (PST)
Received: by mail-yw0-f178.google.com with SMTP id y186so2281185ywf.7
	for <meta-ti@yoctoproject.org>; Mon, 12 Feb 2018 08:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=DUFVouyqjQlgGvPhGk0K4nCmgEW3FD3PN7UczTdqIFg=;
	b=n6MIAlsauI4KSxljovJEYYcO/QAOs7DNylzrEN/LRyR8JLe1BRKHaTw+hvNnHOuK4O
	TWD7oQdtmwI0VRzAWyDRYL7jI2k60OBXj1RVuAAfeW9htVKaGiofLoO8lv6ht+6DKf7a
	SFGlooQqvAKTsjxzIUOApuA+rrpV6/jcqL8m6B9b6fzF5jtVIRB6B6hYkiOT32vBjA77
	Dcvq2uvR0sxzfnI3OHNhLyGEQi6ArrLyjrY7zNFFwC1Ky5LnXgizK/bk9WWG++T4J8ca
	AJjBtpj8z1OVzWhHP9tnCaa8TCG0bpYcpZlKp6n+InzcQ3OFB9Vht5hXkJrQZ19VgEV4
	TbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=DUFVouyqjQlgGvPhGk0K4nCmgEW3FD3PN7UczTdqIFg=;
	b=Hawy4b8OJDI2KzWmgMANfz5mhBibZEgBvPyOUGxGZRJ5v4hT2cx4Ye5NX9LCEU1mVw
	n0xssGqtlhXBPCyflaFlagpSwbk94Pd0mthgrRysL5SgqEnaNtHiLrp9M37HcwjcoufE
	YSCw1y5M1BAk6xo7u81QGio7MDk8/wFBSP44YCbfwJK17LfcijDkmencYSmMHfid1UJP
	RiVGaFLmFIaOdm8Hz8ZTYrODCPdsLYiWqjVoRtT/KIUfo7GDCHVR4Um3Y+ZwzQ16pes9
	rwZ3KmqVgzUytTHj9gDvNKOtnpt8wYiIySLhTyCjE7SsX2gi04iILbN8NRNXW6a9eghz
	sCAg==
X-Gm-Message-State: APf1xPBTd+cyCff868w+gz+WrN2vvwP2LT6Pqeg4KS/2/ZYyueqzc+9I
	lNw+1WxVmDn/AxGWFyPvgGifOegI69vpwz4UI3A=
X-Google-Smtp-Source: AH8x225RnTNw/5Ob48UHMyisf+PiKhuQinRiF43sWEHQExxMr5zvkx3QHhaY4K5c+2q+ImdRF90DTh5FBNZuKksfpjs=
X-Received: by 10.37.55.138 with SMTP id e132mr7869634yba.110.1518451445143;
	Mon, 12 Feb 2018 08:04:05 -0800 (PST)
MIME-Version: 1.0
References: <CAFeBWL7N1D8KQxdz2AqhDHbcww8+8x8ouMKRw4rK5ubf7Z63Uw@mail.gmail.com>
In-Reply-To: <CAFeBWL7N1D8KQxdz2AqhDHbcww8+8x8ouMKRw4rK5ubf7Z63Uw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Mon, 12 Feb 2018 16:03:54 +0000
Message-ID: <CAFeBWL5wNMRYoK1wW3nL3xo10ySpJbdYXmPjr0fnVBctyR7Lyw@mail.gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Weston Desktop Shell
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
X-List-Received-Date: Mon, 12 Feb 2018 16:04:08 -0000
Content-Type: multipart/alternative; boundary="001a114738baff1e7105650606ac"

--001a114738baff1e7105650606ac
Content-Type: text/plain; charset="UTF-8"

I spent a bit of time getting the logs:

root@am57xx-evm:~# weston --backend=drm-backend.so --tty=4
Date: 2018-01-08 UTC
[19:24:55.053] weston 2.0.0
               http://wayland.freedesktop.org
               Bug reports to:
https://bugs.freedesktop.org/enter_bug.cgi?product=Wayland&component=weston&version=2.0.0
               Build: c26dbf3-dirty weston-launch: Provide a default
version that doesn't require PAM (2018-02-09 11:58:14 -0500)
[19:24:55.053] Command line: weston --backend=drm-backend.so --tty=4
[19:24:55.053] OS: Linux, 4.9.69-g89d085d1a4, #10 SMP PREEMPT Thu Feb 8
12:11:21 EST 2018, armv7l
[19:24:55.053] Using config file '/etc//weston.ini'
[19:24:55.054] Output repaint window is 7 ms maximum.
[19:24:55.054] Loading module '/usr/lib/libweston-2/drm-backend.so'
[19:24:55.055] initializing drm backend
[19:24:55.091] using /dev/dri/card1
[19:24:55.091] Loading module '/usr/lib/libweston-2/gl-renderer.so'
failed to load module: /usr/lib/gbm/gbm_dri.so: cannot open shared object
file: No such file or directory
failed to load module: /usr/lib/gbm/gbm_gallium_drm.so: cannot open shared
object file: No such file or directory
loaded module : gbm_pvr.so
found valid GBM backend : gbm_pvr.so
PVR:(Error): [ 1157-> 1157] <
gbm_pvr_create_device():592|ERROR> Failed to create DBM device: No such
device [0, ]
[19:24:55.095] failed to initialize egl
[19:24:55.120] fatal: failed to create compositor backend

Any insight as to why this is happening, it would be much appreciated.

Adam

On Fri, Feb 9, 2018 at 3:26 PM Adam Lee <adam.yh.lee@gmail.com> wrote:

> Has anyone successfully brought up Weston desktop shell on the current
> master on Beagleboard X15 or AM57xx-EVM? I am having EGL initialization
> error. I don't know if it is something I have mis-configured.
>
> BR,
>
> Adam
>

--001a114738baff1e7105650606ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I spent a bit of time getting the logs:<div><br></div><div=
><div>root@am57xx-evm:~# weston --backend=3Ddrm-backend.so --tty=3D4</div><=
div>Date: 2018-01-08 UTC</div><div>[19:24:55.053] weston 2.0.0</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://wa=
yland.freedesktop.org">http://wayland.freedesktop.org</a></div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bug reports to: <a href=3D"=
https://bugs.freedesktop.org/enter_bug.cgi?product=3DWayland&amp;component=
=3Dweston&amp;version=3D2.0.0">https://bugs.freedesktop.org/enter_bug.cgi?p=
roduct=3DWayland&amp;component=3Dweston&amp;version=3D2.0.0</a></div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Build: c26dbf3-dirty=
 weston-launch: Provide a default version that doesn&#39;t require PAM (201=
8-02-09 11:58:14 -0500)</div><div>[19:24:55.053] Command line: weston --bac=
kend=3Ddrm-backend.so --tty=3D4</div><div>[19:24:55.053] OS: Linux, 4.9.69-=
g89d085d1a4, #10 SMP PREEMPT Thu Feb 8 12:11:21 EST 2018, armv7l</div><div>=
[19:24:55.053] Using config file &#39;/etc//weston.ini&#39;</div><div>[19:2=
4:55.054] Output repaint window is 7 ms maximum.</div><div>[19:24:55.054] L=
oading module &#39;/usr/lib/libweston-2/drm-backend.so&#39;</div><div>[19:2=
4:55.055] initializing drm backend</div><div>[19:24:55.091] using /dev/dri/=
card1</div><div>[19:24:55.091] Loading module &#39;/usr/lib/libweston-2/gl-=
renderer.so&#39;</div><div>failed to load module: /usr/lib/gbm/gbm_dri.so: =
cannot open shared object file: No such file or directory</div><div>failed =
to load module: /usr/lib/gbm/gbm_gallium_drm.so: cannot open shared object =
file: No such file or directory</div><div>loaded module : gbm_pvr.so</div><=
div>found valid GBM backend : gbm_pvr.so</div><div>PVR:(Error): [ 1157-&gt;=
 1157] &lt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gbm_pvr_create_=
device():592|ERROR&gt; Failed to create DBM device: No such device [0, ]</d=
iv><div>[19:24:55.095] failed to initialize egl</div><div>[19:24:55.120] fa=
tal: failed to create compositor backend</div></div><div><br></div><div>Any=
 insight as to why this is happening, it would be much appreciated.</div><d=
iv><br></div><div>Adam</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Fri, Feb 9, 2018 at 3:26 PM Adam Lee &lt;<a href=3D"mailto:adam.yh.lee@=
gmail.com" target=3D"_blank">adam.yh.lee@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">Has anyone successfully bro=
ught up Weston desktop shell on the current master on Beagleboard X15 or AM=
57xx-EVM? I am having EGL initialization error. I don&#39;t know if it is s=
omething I have mis-configured.<div><br></div><div>BR,</div><div><br></div>=
<div>Adam</div></div></blockquote></div></div>

--001a114738baff1e7105650606ac--
