Return-Path: <cliff.brake@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 948FAE002A6
	for <meta-ti@yoctoproject.org>; Fri, 17 Aug 2012 05:31:57 -0700 (PDT)
Received: by lboi15 with SMTP id i15so2379498lbo.35
	for <meta-ti@yoctoproject.org>; Fri, 17 Aug 2012 05:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KOymNl+e0v2M6gw/Xjglq5otqORNQN7nfE7WrLAxZDI=;
	b=TPkB37PcvBO86Xv8shOH8ixRLm0TOVQCQZzaIdyyjoJmc3S+JGrakwgxKixY9hfN5r
	fmlPMrOuc5yCI3k/f8YTC6j10eUVwRLLgqR/ldrwdbfSKdqzLfBSLrN4AzX+a5I7VDoN
	mIQYkZi8uajxfxmjA/uk+FAxkzWFjpmhXi4JugY2IRkZhfG9MdJxHWyHEnB4CahDHZlo
	loQw0za/knSFtEdYTJ0u/2nxG03WjHaLkbonPGSK1ZUXEsqtPSHukrNvlWKN11cgJbPR
	jMfjzQnjJ02MCLdl2TXNtSpQHYi9rcA4l2AOnJHlbGrZ+ehznNJhEMGHBx3F5a6AH7fI
	7MLw==
MIME-Version: 1.0
Received: by 10.112.37.102 with SMTP id x6mr2154634lbj.66.1345206716524; Fri,
	17 Aug 2012 05:31:56 -0700 (PDT)
Received: by 10.112.85.196 with HTTP; Fri, 17 Aug 2012 05:31:56 -0700 (PDT)
In-Reply-To: <CAOd_LFykYAUshiFk7O5_6AZ6D7YNhcd394-eNmGs-=dBLs6R-A@mail.gmail.com>
References: <CAOd_LFyjs=9C3Y2rO8R1A7GX0JO_iS+Vq7=k5m2FLFF7jdgivQ@mail.gmail.com>
	<20120817022141.GA14556@denix.org>
	<CAOd_LFykYAUshiFk7O5_6AZ6D7YNhcd394-eNmGs-=dBLs6R-A@mail.gmail.com>
Date: Fri, 17 Aug 2012 08:31:56 -0400
Message-ID: <CAOd_LFyt-msPFWgYiWSWGEWneUV_XHvKw6HFojM2rDvb8Y-WAA@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 Aug 2012 12:31:58 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe35867ceac904c7755890

--e0cb4efe35867ceac904c7755890
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 17, 2012 at 8:29 AM, Cliff Brake <cliff.brake@gmail.com> wrote:

> On Thu, Aug 16, 2012 at 10:21 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>
>> On Thu, Aug 16, 2012 at 06:11:59PM -0400, Cliff Brake wrote:
>> > I've noticed with recent Angstrom images running on OMAP class CPUs, it
>> > seems the IO CPU usage is very high when running from SD cards.  When
>> there
>> > is a lot of disk activity, the system becomes fairly unresponsive, and
>> CPU
>> > io usage is usually pegged.  Is this expected?  I don't recall seeing
>> this
>> > with older kernels such as 2.6.39 which I'm using on an older project.
>>
>> Cliff,
>>
>> Do you use kernel-mainline_3.2 from meta-ti that is crafted for
>> beagleboard or
>> something else?
>
>
> Whatever comes from the Angstrom/meta-ti master branch these days:
>
>
this is the version: linux-mainline-3.2.18-r121b


> root@beagleboard:~# cat /proc/version
> Linux version 3.2.18 (cbrake@happy.bec-systems.com) (gcc version 4.7.2
> 20120706 (prerelease) (GCC) ) #1 Thu Aug 16 08:50:30 EDT 2012
>
> I'll try to do more systematic testing ...
>
> Is there another kernel I should try?
>
> Cliff
>
> --
> =================
> http://bec-systems.com
>



-- 
=================
http://bec-systems.com

--e0cb4efe35867ceac904c7755890
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Fri, Aug 17, 2012 at 8:29 AM, Cliff B=
rake <span dir=3D"ltr">&lt;<a href=3D"mailto:cliff.brake@gmail.com" target=
=3D"_blank">cliff.brake@gmail.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<div class=3D"gmail_quote"><div><div class=3D"h5">On Thu, Aug 16, 2012 at 1=
0:21 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti=
.com" target=3D"_blank">denys@ti.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">

<div>On Thu, Aug 16, 2012 at 06:11:59PM -0400, Cliff Brake wrote:<br>
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
something else?</blockquote><div><br></div></div></div><div>Whatever comes =
from the Angstrom/meta-ti master branch these days:</div><div><br></div></d=
iv></blockquote><div><br></div><div>this is the version:=A0linux-mainline-3=
.2.18-r121b</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_quote"><di=
v></div><div><div>root@beagleboard:~# cat /proc/version=A0</div><div>Linux =
version 3.2.18 (<a href=3D"mailto:cbrake@happy.bec-systems.com" target=3D"_=
blank">cbrake@happy.bec-systems.com</a>) (gcc version 4.7.2 20120706 (prere=
lease) (GCC) ) #1 Thu Aug 16 08:50:30 EDT 2012</div>

</div><div><br></div><div>I&#39;ll try to do more systematic testing ...</d=
iv><div><br></div><div>Is there another kernel I should try?</div><span cla=
ss=3D"HOEnZb"><font color=3D"#888888"><div><br></div><div>Cliff</div><div>
=A0</div></font></span></div><span class=3D"HOEnZb"><font color=3D"#888888"=
>-- <br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><a href=3D"h=
ttp://bec-systems.com" target=3D"_blank">http://bec-systems.com</a><br>

</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><a href=3D"http://=
bec-systems.com" target=3D"_blank">http://bec-systems.com</a><br>

--e0cb4efe35867ceac904c7755890--
