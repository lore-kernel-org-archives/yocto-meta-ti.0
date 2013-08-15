Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49F17E01440
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 12:10:25 -0700 (PDT)
Received: by mail-ob0-f170.google.com with SMTP id eh20so1264793obb.1
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 12:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vYFp4gZSdUUjJL7glPAqVnnh48aFitR3mpltjhX0xaQ=;
	b=wajmQuY9FBiHmxpR+p4xXcTe/rA2mkrKO/04M/AxSSL4VW9T6VW/oUQ6foPWkGjad3
	mhKCteK2U/z/y+uJUmsBXhSzowtcuA+FYakqpUHUeWbotk2eQ4QemFYi4y2jhQS2ojQh
	IUX4j/vH2o3oKb7t6Wg3FZMzRmihzVE8n6Sk/Z9A4e4DT3cXk1JXn1WClcW8WKpRbIJd
	OTKhUsoxb41yD+qQQQ9VkqQYMJ+FsWFQfkrdfmYNZfPjHebwP16y/FNnrUn63pUTJFsl
	3zBcJywetn4blk8D8CYZahjTMg6ic/cYhaQxmrMO/0272sYDhuWdxuJ/OoqzngCGLgu7
	/lDw==
MIME-Version: 1.0
X-Received: by 10.182.130.131 with SMTP id oe3mr27253250obb.34.1376593824775; 
	Thu, 15 Aug 2013 12:10:24 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 15 Aug 2013 12:10:24 -0700 (PDT)
In-Reply-To: <CABcZANkNbqisKRLHTGmRSs=mbR4VBg2TqfV+CJp54R3G2eNUng@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CABcZANkNbqisKRLHTGmRSs=mbR4VBg2TqfV+CJp54R3G2eNUng@mail.gmail.com>
Date: Thu, 15 Aug 2013 15:10:24 -0400
Message-ID: <CAFZh4h8eAULbEJPVeMtA51gQK293bUEKPGpMxtmX2Z8kJSgJJA@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Thu, 15 Aug 2013 19:10:27 -0000
Content-Type: multipart/alternative; boundary=089e013cbdc4ed05de04e4013910

--089e013cbdc4ed05de04e4013910
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 15, 2013 at 12:25 PM, Chris Larson <clarson@kergoth.com> wrote:

>
> I haven't seen the panic, but I have seen a complete silent boot hang when
> moving from 4.6 to 4.7 or 4.8 on my OMAP5 EVM board. The gcc-linaro
> toolchain worked, as did a 2012.03 sourcery toolchain, but neither the
> 2013.05 toolchain nor the internal built yocto toolchain from 1.5/master
> resulted in a successful boot. I got past that issue by cherry picking
> these two commits from a more recent kernel:
>
> 455bd4c430b0c0a361f38e8658a0d6cb469942b5 - ARM: 7668/1: fix memset-related
> crashes caused by recent GCC (4.7.2) optimizations
> 418df63adac56841ef6b0f1fcf435bc64d4ed177 - ARM: 7670/1: fix the memset fix
>
> See also
> http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/39864
>
>
>
I found this thread which is bang on with my problem but didn't see a
solution yet:
https://lists.yoctoproject.org/pipermail/meta-ti/2012-May/001144.html

Regards,

Brain

--089e013cbdc4ed05de04e4013910
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 15, 2013 at 12:25 PM, Chris Larson <span dir=
=3D"ltr">&lt;<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clars=
on@kergoth.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"=
im"><br>
</div>I haven&#39;t seen the panic, but I have seen a complete silent boot =
hang when moving from 4.6 to 4.7 or 4.8 on my OMAP5 EVM board. The gcc-lina=
ro toolchain worked, as did a 2012.03 sourcery toolchain, but neither the 2=
013.05 toolchain nor the internal built yocto toolchain from 1.5/master res=
ulted in a successful boot. I got past that issue by cherry picking these t=
wo commits from a more recent kernel:</div>


<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">455bd4c430b=
0c0a361f38e8658a0d6cb469942b5 -=A0ARM: 7668/1: fix memset-related crashes c=
aused by recent GCC (4.7.2) optimizations</div><div class=3D"gmail_extra">4=
18df63adac56841ef6b0f1fcf435bc64d4ed177 -=A0ARM: 7670/1: fix the memset fix=
<br>


</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">See a=
lso=A0<a href=3D"http://comments.gmane.org/gmane.comp.handhelds.openembedde=
d.core/39864" target=3D"_blank">http://comments.gmane.org/gmane.comp.handhe=
lds.openembedded.core/39864</a></div>



<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><br></div><=
/div></blockquote><div><br></div><div>I found this thread which is bang on =
with my problem but didn&#39;t see a solution yet:</div><div><a href=3D"htt=
ps://lists.yoctoproject.org/pipermail/meta-ti/2012-May/001144.html">https:/=
/lists.yoctoproject.org/pipermail/meta-ti/2012-May/001144.html</a></div>
<div><br></div><div>Regards,</div><div><br></div><div>Brain=A0</div></div><=
/div></div>

--089e013cbdc4ed05de04e4013910--
