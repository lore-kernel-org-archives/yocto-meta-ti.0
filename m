Return-Path: <cliff.brake@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5EEBAE0034C
	for <meta-ti@yoctoproject.org>; Sat, 17 Nov 2012 11:34:42 -0800 (PST)
Received: by mail-vb0-f48.google.com with SMTP id l22so2155470vbn.35
	for <meta-ti@yoctoproject.org>; Sat, 17 Nov 2012 11:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zqRrYTYwvGxpZnhcUilJcYqbgFFxZXUHMSjzGC+lomE=;
	b=xGk5tEzc7mZngmEW03Es/wAJ7jBnaH9jjSWiAozD8bhLpjWPVxundUoKq1xRQ9g9PE
	TD3Px4oezQ0LxqDHjAMB5TRcvNzSbbDywKxVYHww3auvNSvARYP92CAgbwn1dMoTT1ai
	OrtqpqCB5BnJSs/ASmQU1LaQDYe4zBW6ONalATHQQtDpc+6hOKILTxdAM9CLwQ5+YeeS
	yY7M9Oi/7PVQH2UDNS8QSHDs6WoFmWZt2r2JpLRYseTTpzgvQtKzWDBBsNU8oqaDC4J9
	+5DlAhmNEiovH9YL57p577t++ylAHfeHOFhf3YT0dnvw9Rzo8Y6TC4QJvrypLmOjetVB
	r+zw==
MIME-Version: 1.0
Received: by 10.220.115.19 with SMTP id g19mr12541256vcq.69.1353180881378;
	Sat, 17 Nov 2012 11:34:41 -0800 (PST)
Received: by 10.58.155.199 with HTTP; Sat, 17 Nov 2012 11:34:41 -0800 (PST)
In-Reply-To: <CAOd_LFwO7qx6HFrQOuGCJCYQ7vCMVikkZ80XX=3Hd=t8qDkOQA@mail.gmail.com>
References: <CAOd_LFxJGZ=MW6ni9Sr3PzUQruNNgf=Wzuw+nJYjO1bTxDQUZA@mail.gmail.com>
	<20121117000555.GK7631@edge>
	<CAOd_LFwO7qx6HFrQOuGCJCYQ7vCMVikkZ80XX=3Hd=t8qDkOQA@mail.gmail.com>
Date: Sat, 17 Nov 2012 14:34:41 -0500
Message-ID: <CAOd_LFxd=_sjk3Vd-cnjLnrP=bT-fkya7sbqcCZCnmMjAcU=7w@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: which kernel for pandaboard?
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
X-List-Received-Date: Sat, 17 Nov 2012 19:34:42 -0000
Content-Type: multipart/alternative; boundary=f46d042fd726c05c0104ceb5f995

--f46d042fd726c05c0104ceb5f995
Content-Type: text/plain; charset=ISO-8859-1

copying mail list ...

On Sat, Nov 17, 2012 at 2:33 PM, Cliff Brake <cliff.brake@gmail.com> wrote:

> On Fri, Nov 16, 2012 at 7:05 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>
>> On Fri, Nov 16, 2012 at 04:56:53PM -0500, Cliff Brake wrote:
>> > I'm trying to boot a recent oe-core+meta-oe+meta-angstrom+meta-ti on a
>> > pandaboard.  With 3.4, I get the attached.  With 3.1, I get the below:
>>
>> 3.4 should work. With 3.1 there were some reports that it didn't boot,
>> when
>> built with recent toolchain from oe-core... What problems do you have with
>> 3.4? Does it boot?
>>
>
> I don't get to a log-in prompt:
>
> > [    2.908050] asoc: snd-soc-dummy-dai <-> omap-mcbsp.1 mapping ok
> > [    2.914672] asoc: snd-soc-dummy-dai <-> omap-mcbsp.2 mapping ok
> > [    2.921295] usb 1-1.1: new high-speed USB device number 3 using
> ehci-omap
> > [    2.928680] asoc: snd-soc-dummy-dai <-> omap-mcbsp.2 mapping ok
> > [    2.936370] input: Panda Headset Jack as /devices/platform/omap-abe-
> twl6040/sound/card0/input0
> > [    2.950714] asoc: omap-hdmi-hifi <-> omap-hdmi-audio-dai mapping ok
> > [    2.958496] u32 classifier
> > [    2.961364]     Actions configured
> > [    2.965362] TCP: cubic registered
> > [    2.969390] NET: Registered protocol family 10
> > [    2.975006] NET: Registered protocol family 17
> > [    2.979888] lib80211: common routines for IEEE802.11 drivers
> > [    2.986083] Registering the dns_resolver key type
> > [    2.991271] VFP support v0.3: implementor 41 architecture 3 part 30
> variant 9 rev 1
> > [    2.999420] ThumbEE CPU extension supported.
> > [    3.003997] Registering SWP/SWPB emulation handler
>
> (nothing more)
>
> I wonder if its something wrong with the MMC driver or config?  At a
> glance, it looks ok.
>
> CONFIG_MMC=y
> CONFIG_MMC_BLOCK=y
> CONFIG_MMC_BLOCK_BOUNCE=y
> # CONFIG_MMC_BLOCK_DEFERRED_RESUME is not set
> CONFIG_MMC_BLOCK_MINORS=16
> # CONFIG_MMC_CLKGATE is not set
> # CONFIG_MMC_DEBUG is not set
> # CONFIG_MMC_DW is not set
> # CONFIG_MMC_EMBEDDED_SDIO is not set
> CONFIG_MMC_OMAP=y
> CONFIG_MMC_OMAP_HS=y
> # CONFIG_MMC_PARANOID_SD_INIT is not set
> CONFIG_MMC_SDHCI=m
> CONFIG_MMC_SDHCI_PLTFM=m
> # CONFIG_MMC_SDHCI_PXAV2 is not set
> # CONFIG_MMC_SDHCI_PXAV3 is not set
> # CONFIG_MMC_TEST is not set
> # CONFIG_MMC_TMIO is not set
> CONFIG_MMC_UNSAFE_RESUME=y
> CONFIG_MMC_USHC=m
> CONFIG_MMC_VUB300=m
>
> Perhaps I'll try an initramfs next and see if that boots.
>
> Thanks,
> Cliff
>
> --
> =================
> http://bec-systems.com
>



-- 
=================
http://bec-systems.com

--f46d042fd726c05c0104ceb5f995
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

copying mail list ...<br><br><div class=3D"gmail_quote">On Sat, Nov 17, 201=
2 at 2:33 PM, Cliff Brake <span dir=3D"ltr">&lt;<a href=3D"mailto:cliff.bra=
ke@gmail.com" target=3D"_blank">cliff.brake@gmail.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Fri, Nov 16, 2012 at 7:05 PM, Denys Dmytriyenko <span =
dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.=
com</a>&gt;</span> wrote:<br></div><div class=3D"gmail_quote"><div class=3D=
"im"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">


<div>On Fri, Nov 16, 2012 at 04:56:53PM -0500, Cliff Brake wrote:<br>
&gt; I&#39;m trying to boot a recent oe-core+meta-oe+meta-angstrom+meta-ti =
on a<br>
&gt; pandaboard. =A0With 3.4, I get the attached. =A0With 3.1, I get the be=
low:<br>
<br>
</div>3.4 should work. With 3.1 there were some reports that it didn&#39;t =
boot, when<br>
built with recent toolchain from oe-core... What problems do you have with<=
br>
3.4? Does it boot?<br></blockquote><div><br></div></div><div>I don&#39;t ge=
t to a log-in prompt:</div><div class=3D"im"><div><br></div><div><span styl=
e=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-serif">&gt; =
[ =A0 =A02.908050] asoc: snd-soc-dummy-dai &lt;-&gt; omap-mcbsp.1 mapping o=
k</span><br style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,s=
ans-serif">


<span style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-se=
rif">&gt; [ =A0 =A02.914672] asoc: snd-soc-dummy-dai &lt;-&gt; omap-mcbsp.2=
 mapping ok</span><br style=3D"color:rgb(34,34,34);font-size:13px;font-fami=
ly:arial,sans-serif">


<span style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-se=
rif">&gt; [ =A0 =A02.921295] usb 1-1.1: new high-speed USB device number 3 =
using ehci-omap</span><br style=3D"color:rgb(34,34,34);font-size:13px;font-=
family:arial,sans-serif">


<span style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-se=
rif">&gt; [ =A0 =A02.928680] asoc: snd-soc-dummy-dai &lt;-&gt; omap-mcbsp.2=
 mapping ok</span><br style=3D"color:rgb(34,34,34);font-size:13px;font-fami=
ly:arial,sans-serif">


<span style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-se=
rif">&gt; [ =A0 =A02.936370] input: Panda Headset Jack as /devices/platform=
/omap-abe-</span><span style=3D"color:rgb(34,34,34);font-size:13px;font-fam=
ily:arial,sans-serif">twl6040/sound/card0/input0</span><br style=3D"color:r=
gb(34,34,34);font-size:13px;font-family:arial,sans-serif">


<span style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-se=
rif">&gt; [ =A0 =A02.950714] asoc: omap-hdmi-hifi &lt;-&gt; omap-hdmi-audio=
-dai mapping ok</span><br style=3D"color:rgb(34,34,34);font-size:13px;font-=
family:arial,sans-serif">


<span style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-se=
rif">&gt; [ =A0 =A02.958496] u32 classifier</span><br style=3D"color:rgb(34=
,34,34);font-size:13px;font-family:arial,sans-serif">
<span style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-se=
rif">&gt; [ =A0 =A02.961364] =A0 =A0 Actions configured</span><br style=3D"=
color:rgb(34,34,34);font-size:13px;font-family:arial,sans-serif">
<span style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-se=
rif">&gt; [ =A0 =A02.965362] TCP: cubic registered</span><br style=3D"color=
:rgb(34,34,34);font-size:13px;font-family:arial,sans-serif">
<span style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-se=
rif">&gt; [ =A0 =A02.969390] NET: Registered protocol family 10</span><br s=
tyle=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-serif">
<span style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-se=
rif">&gt; [ =A0 =A02.975006] NET: Registered protocol family 17</span><br s=
tyle=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-serif">
<span style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-se=
rif">&gt; [ =A0 =A02.979888] lib80211: common routines for IEEE802.11 drive=
rs</span><br style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,=
sans-serif">


<span style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-se=
rif">&gt; [ =A0 =A02.986083] Registering the dns_resolver key type</span><b=
r style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-serif"=
>
<span style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-se=
rif">&gt; [ =A0 =A02.991271] VFP support v0.3: implementor 41 architecture =
3 part 30 variant 9 rev 1</span><br style=3D"color:rgb(34,34,34);font-size:=
13px;font-family:arial,sans-serif">


<span style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-se=
rif">&gt; [ =A0 =A02.999420] ThumbEE CPU extension supported.</span><br sty=
le=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-serif">
<span style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-se=
rif">&gt; [ =A0 =A03.003997] Registering SWP/SWPB emulation handler</span><=
/div><div><br></div></div><div>(nothing more)</div>
<div><br></div><div>I wonder if its something wrong with the MMC driver or =
config? =A0At a glance, it looks ok.</div><div><br></div><div><div>CONFIG_M=
MC=3Dy</div><div>CONFIG_MMC_BLOCK=3Dy</div><div>CONFIG_MMC_BLOCK_BOUNCE=3Dy=
</div>

<div># CONFIG_MMC_BLOCK_DEFERRED_RESUME is not set</div><div>CONFIG_MMC_BLO=
CK_MINORS=3D16</div><div># CONFIG_MMC_CLKGATE is not set</div><div># CONFIG=
_MMC_DEBUG is not set</div><div># CONFIG_MMC_DW is not set</div><div># CONF=
IG_MMC_EMBEDDED_SDIO is not set</div>

<div>CONFIG_MMC_OMAP=3Dy</div><div>CONFIG_MMC_OMAP_HS=3Dy</div><div># CONFI=
G_MMC_PARANOID_SD_INIT is not set</div><div>CONFIG_MMC_SDHCI=3Dm</div><div>=
CONFIG_MMC_SDHCI_PLTFM=3Dm</div><div># CONFIG_MMC_SDHCI_PXAV2 is not set</d=
iv>
<div>
# CONFIG_MMC_SDHCI_PXAV3 is not set</div><div># CONFIG_MMC_TEST is not set<=
/div><div># CONFIG_MMC_TMIO is not set</div><div>CONFIG_MMC_UNSAFE_RESUME=
=3Dy</div><div>CONFIG_MMC_USHC=3Dm</div><div>CONFIG_MMC_VUB300=3Dm</div></d=
iv>
<div>
<br></div><div>Perhaps I&#39;ll try an initramfs next and see if that boots=
.</div><div><br></div><div>Thanks,</div><div>Cliff</div><span class=3D"HOEn=
Zb"><font color=3D"#888888"><div><br></div></font></span></div><span class=
=3D"HOEnZb"><font color=3D"#888888">-- <br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><a href=3D"http://be=
c-systems.com" target=3D"_blank">http://bec-systems.com</a><br>

</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><a href=3D"http://=
bec-systems.com" target=3D"_blank">http://bec-systems.com</a><br>

--f46d042fd726c05c0104ceb5f995--
