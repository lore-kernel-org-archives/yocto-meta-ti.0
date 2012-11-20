Return-Path: <ndec13@gmail.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62B76E01423
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 08:52:53 -0800 (PST)
Received: by mail-qa0-f41.google.com with SMTP id c26so1005957qad.14
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 08:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=T4zvQZawmRA8evfJmFopOIWHeKb118/5KnR/xqZInwA=;
	b=dEgE3WWRCmCY2mr5BZnqg9LNWVMonTVMJ1j3ko5LFGD3G7PVHFQgwkZBgs0ws14tFO
	s8AE0ArPYJXeA2wLPHQX6ubnPfYoQcN/Hs8tdl2FeH2UBu5ZftBIplTH68sj5+XBi7RH
	dL/P9AQ0xkYTu6C6HhvTHETZqeWrsgplV+VsOIcZxePpUZu3Om632eA3FZMGWqUnB/WI
	lzIlu4q2MIO7fKKFqbez7NjV1HzBrUpV02VczWC/NC99kqP4R+PcwC7Z0Mqskp1cM6Wg
	GtLKAjbSydP5GCdJqlC429PyFht1c5VVLXDZNftRttEJoXwJt1o73g6Ily949F1bP0uh
	GlVw==
Received: by 10.224.168.80 with SMTP id t16mr15297546qay.8.1353430372840; Tue,
	20 Nov 2012 08:52:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.49.121.161 with HTTP; Tue, 20 Nov 2012 08:52:32 -0800 (PST)
In-Reply-To: <CAOd_LFwhgJNzxpRYjX+w32PemaqRZCOPFop0QXeiVSLqMHBhjA@mail.gmail.com>
References: <CAOd_LFxJGZ=MW6ni9Sr3PzUQruNNgf=Wzuw+nJYjO1bTxDQUZA@mail.gmail.com>
	<20121117000555.GK7631@edge>
	<CAOd_LFwO7qx6HFrQOuGCJCYQ7vCMVikkZ80XX=3Hd=t8qDkOQA@mail.gmail.com>
	<CAOd_LFxd=_sjk3Vd-cnjLnrP=bT-fkya7sbqcCZCnmMjAcU=7w@mail.gmail.com>
	<CA+2YH7v8JzAnc=BgQ1h4n4ZJ+niVXL00+g-s+CtTnkjbV1x0gg@mail.gmail.com>
	<CAOd_LFwhgJNzxpRYjX+w32PemaqRZCOPFop0QXeiVSLqMHBhjA@mail.gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Tue, 20 Nov 2012 17:52:32 +0100
Message-ID: <CAOT3mi+VtFO+RteB5C1sBbijMKWzqaFx=povvEDQay+6YdH3eA@mail.gmail.com>
To: Cliff Brake <cliff.brake@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Tue, 20 Nov 2012 16:52:53 -0000
Content-Type: multipart/alternative; boundary=20cf3074b29899f69d04cef010ff

--20cf3074b29899f69d04cef010ff
Content-Type: text/plain; charset=ISO-8859-1

hi,

On Tue, Nov 20, 2012 at 3:02 PM, Cliff Brake <cliff.brake@gmail.com> wrote:

> [    0.000000] OMAP4430 ES2.0
> ....
> [    2.950775] asoc: omap-hdmi-hifi <-> omap-hdmi-audio-dai mapping ok
> [    2.958465] u32 classifier
> [    2.961364]     Actions configured
> [    2.965332] TCP: cubic registered
> [    2.969390] NET: Registered protocol family 10
> [    2.974975] NET: Registered protocol family 17
> [    2.979858] lib80211: common routines for IEEE802.11 drivers
> [    2.986053] Registering the dns_resolver key type
> [    2.991271] VFP support v0.3: implementor 41 architecture 3 part 30
> variant 9 rev 1
> [    2.999572] ThumbEE CPU extension supported.
> [    3.004211] Registering SWP/SWPB emulation handler
>
> (stops here)
>
> As mentioned before, mainline kernels boot fine on this board, so it
> appears the meta-ti kernel has problems with at least some non-ES
> Panda boards.
>
> Enrico, can you send me a complete boot log from your system?  Perhaps
> if I can see which drivers are being initialized after the above
> message, then we can more easily narrow it down.
>
> Also, do you have the display working on your system?  If so, did you
> have to add any special kernel command line args to select the display
> format, etc?
>

sorry to jump in late... and I just noticed that you are using ES2.0
revision of 4430 (I didn't notice that so far).

i can confirm that we have problems on old ES for 4430, in fact that kernel
seems to be working on ES2.2+.

we don't have the root cause for that, so anything that you can find would
certainly be helpful.

--20cf3074b29899f69d04cef010ff
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra">hi,<br><br><div class=3D"gmail_quote">On Tue, No=
v 20, 2012 at 3:02 PM, Cliff Brake <span dir=3D"ltr">&lt;<a href=3D"mailto:=
cliff.brake@gmail.com" target=3D"_blank">cliff.brake@gmail.com</a>&gt;</spa=
n> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>[ =A0 =A00.000000] OMAP4430 ES2.0<br>
....<br>
[ =A0 =A02.950775] asoc: omap-hdmi-hifi &lt;-&gt; omap-hdmi-audio-dai mappi=
ng ok<br>
[ =A0 =A02.958465] u32 classifier<br>
[ =A0 =A02.961364] =A0 =A0 Actions configured<br>
[ =A0 =A02.965332] TCP: cubic registered<br>
<div>[ =A0 =A02.969390] NET: Registered protocol family 10<br>
</div>[ =A0 =A02.974975] NET: Registered protocol family 17<br>
[ =A0 =A02.979858] lib80211: common routines for IEEE802.11 drivers<br>
[ =A0 =A02.986053] Registering the dns_resolver key type<br>
<div>[ =A0 =A02.991271] VFP support v0.3: implementor 41 architecture 3 par=
t 30<br>
variant 9 rev 1<br>
</div>[ =A0 =A02.999572] ThumbEE CPU extension supported.<br>
[ =A0 =A03.004211] Registering SWP/SWPB emulation handler<br>
<br>
(stops here)<br>
<br>
As mentioned before, mainline kernels boot fine on this board, so it<br>
appears the meta-ti kernel has problems with at least some non-ES<br>
Panda boards.<br>
<br>
Enrico, can you send me a complete boot log from your system? =A0Perhaps<br=
>
if I can see which drivers are being initialized after the above<br>
message, then we can more easily narrow it down.<br>
<br>
Also, do you have the display working on your system? =A0If so, did you<br>
have to add any special kernel command line args to select the display<br>
format, etc?</div></blockquote><div><br></div><div>sorry to jump in late...=
 and I just noticed that you are using ES2.0 revision of 4430 (I didn&#39;t=
 notice that so far).=A0</div><div><br></div><div>i can confirm that we hav=
e problems on old ES for 4430, in fact that kernel seems to be working on E=
S2.2+.=A0</div>


<div><br></div><div>we don&#39;t have the root cause for that, so anything =
that you can find would certainly be helpful.</div><div><br></div><div><br>=
</div>
</div><br></div>

--20cf3074b29899f69d04cef010ff--
