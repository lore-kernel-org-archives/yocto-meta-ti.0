Return-Path: <cliff.brake@gmail.com>
Received: from mail-lpp01m010-f48.google.com (mail-lpp01m010-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B85CBE002A6
	for <meta-ti@yoctoproject.org>; Fri, 17 Aug 2012 05:29:28 -0700 (PDT)
Received: by lagr15 with SMTP id r15so2336209lag.35
	for <meta-ti@yoctoproject.org>; Fri, 17 Aug 2012 05:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UQDX0iK5mAcmvmpu2aKHFwRLr0RiD6/qmEC2Z1Z+ePU=;
	b=bLRxon761xzglU8uLPh06oXRraFWbu7niJeIJwmiAV4InKpPvM9B/WWX1Hbux9hleM
	zUbxOkBYv52VvrTWujJi7waPsnU+Ughg2nk8PzPNFIj+YZRgweBXWW1JXJqZXxuGdpkV
	RcF3oSDKodNgrFL+E5qXfp6xky5lfDW57+C+kEwgDIHyU9SQ36p6JJK9E4qZqfdiAiAs
	JrG7jY/qLZ2mrp+01QpgDENRvZrOEJr6GQ/Zlv7ogUaK7PkI5hfb5dLV2v6UOATvv9EL
	NSGPwQgjGQ2c0tZwWhjuqKF3cjJM3ERgochoheluV0ZXQZ7UHqnn3gf73s1zbzr3yn2p
	un8A==
MIME-Version: 1.0
Received: by 10.152.124.180 with SMTP id mj20mr4716255lab.43.1345206567291;
	Fri, 17 Aug 2012 05:29:27 -0700 (PDT)
Received: by 10.112.85.196 with HTTP; Fri, 17 Aug 2012 05:29:27 -0700 (PDT)
In-Reply-To: <20120817022141.GA14556@denix.org>
References: <CAOd_LFyjs=9C3Y2rO8R1A7GX0JO_iS+Vq7=k5m2FLFF7jdgivQ@mail.gmail.com>
	<20120817022141.GA14556@denix.org>
Date: Fri, 17 Aug 2012 08:29:27 -0400
Message-ID: <CAOd_LFykYAUshiFk7O5_6AZ6D7YNhcd394-eNmGs-=dBLs6R-A@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: io CPU usage high
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 12:29:29 -0000
Content-Type: multipart/alternative; boundary=f46d0434bfde97cc5a04c7754fac

--f46d0434bfde97cc5a04c7754fac
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 16, 2012 at 10:21 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Thu, Aug 16, 2012 at 06:11:59PM -0400, Cliff Brake wrote:
> > I've noticed with recent Angstrom images running on OMAP class CPUs, it
> > seems the IO CPU usage is very high when running from SD cards.  When
> there
> > is a lot of disk activity, the system becomes fairly unresponsive, and
> CPU
> > io usage is usually pegged.  Is this expected?  I don't recall seeing
> this
> > with older kernels such as 2.6.39 which I'm using on an older project.
>
> Cliff,
>
> Do you use kernel-mainline_3.2 from meta-ti that is crafted for
> beagleboard or
> something else?


Whatever comes from the Angstrom/meta-ti master branch these days:

root@beagleboard:~# cat /proc/version
Linux version 3.2.18 (cbrake@happy.bec-systems.com) (gcc version 4.7.2
20120706 (prerelease) (GCC) ) #1 Thu Aug 16 08:50:30 EDT 2012

I'll try to do more systematic testing ...

Is there another kernel I should try?

Cliff

-- 
=================
http://bec-systems.com

--f46d0434bfde97cc5a04c7754fac
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Aug 16, 2012 at 10:21 PM, Denys Dmytriye=
nko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank"=
>denys@ti.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Thu, Aug 16, 2012 at 06:11:59PM -0400, Cliff Brake wro=
te:<br>
&gt; I&#39;ve noticed with recent Angstrom images running on OMAP class CPU=
s, it<br>
&gt; seems the IO CPU usage is very high when running from SD cards. =A0Whe=
n there<br>
&gt; is a lot of disk activity, the system becomes fairly unresponsive, and=
 CPU<br>
&gt; io usage is usually pegged. =A0Is this expected? =A0I don&#39;t recall=
 seeing this<br>
&gt; with older kernels such as 2.6.39 which I&#39;m using on an older proj=
ect.<br>
<br>
</div>Cliff,<br>
<br>
Do you use kernel-mainline_3.2 from meta-ti that is crafted for beagleboard=
 or<br>
something else?</blockquote><div><br></div><div>Whatever comes from the Ang=
strom/meta-ti master branch these days:</div><div><br></div><div><div>root@=
beagleboard:~# cat /proc/version=A0</div><div>Linux version 3.2.18 (<a href=
=3D"mailto:cbrake@happy.bec-systems.com">cbrake@happy.bec-systems.com</a>) =
(gcc version 4.7.2 20120706 (prerelease) (GCC) ) #1 Thu Aug 16 08:50:30 EDT=
 2012</div>
</div><div><br></div><div>I&#39;ll try to do more systematic testing ...</d=
iv><div><br></div><div>Is there another kernel I should try?</div><div><br>=
</div><div>Cliff</div><div>=A0</div></div>-- <br>=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><a href=3D"http://bec-systems.com" target=3D=
"_blank">http://bec-systems.com</a><br>


--f46d0434bfde97cc5a04c7754fac--
