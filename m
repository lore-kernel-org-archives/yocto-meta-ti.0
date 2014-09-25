Return-Path: <manuel.torres.fernandez@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C4F9E0076C; Thu, 25 Sep 2014 08:58:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.176 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (manuel.torres.fernandez[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3491E0074B
	for <meta-ti@yoctoproject.org>; Thu, 25 Sep 2014 08:57:51 -0700 (PDT)
Received: by mail-we0-f176.google.com with SMTP id w61so7316310wes.7
	for <meta-ti@yoctoproject.org>; Thu, 25 Sep 2014 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cnrfeGc3TgU5R4qc0BUnolglf1yrhefUTfvRvsaA3A8=;
	b=l1BPmQabKZe5K0qDhI0iwx7zyANkSZ+QLGTJEhY2S0mAOk0ixhYm6somdq4rprdUMY
	Aoou9bcm0pGDEdAWQflNENWtFTuxvgTtzpN9FdyrDebFE9ot5RdTBljNkA19IcRFUNYn
	FpUqV3L8XYqAcymtIN2cHtRBuf7SkRh/aCwQYzPszOiGnSNaFN3donJVuLevRTfp18DK
	4qVtArC/GSEw8CMHugOEh1D7jjNJf5DKOC13zU6npGKaT3h2ipCUaUlPqAP6NH7wNF7V
	5aDmLM2LnJ9S4rMI/PtoI4uNKbvFRKmSzc9N5+cii3tTjFvxH536YyrEnrWPDcP579WC
	+DWw==
MIME-Version: 1.0
X-Received: by 10.180.74.203 with SMTP id w11mr373912wiv.26.1411660670500;
	Thu, 25 Sep 2014 08:57:50 -0700 (PDT)
Received: by 10.27.8.138 with HTTP; Thu, 25 Sep 2014 08:57:50 -0700 (PDT)
In-Reply-To: <CA+2YH7uaRmXepsmmYXQQ8_UXzsOBnwo1QPxnCSf=xqU1s04Cew@mail.gmail.com>
References: <CAF+2n7Tr+tqEq_R2cr0SuUQ8+PDB5tQKeCW2GLr=RW+-W35o_Q@mail.gmail.com>
	<CA+2YH7t7PVNKA6xT1QcCgGoPY_foe020_sxWk5dJYhmLqi8QYA@mail.gmail.com>
	<CAF+2n7QzdBhtZxJ6oi11KaUovc2PiWpN=Q4gBBm28tMjm3efXw@mail.gmail.com>
	<CA+2YH7uaRmXepsmmYXQQ8_UXzsOBnwo1QPxnCSf=xqU1s04Cew@mail.gmail.com>
Date: Thu, 25 Sep 2014 17:57:50 +0200
Message-ID: <CAF+2n7SGhcgMgD0AXoQb1=WV+P=ZiP9UEYe8RfOr+VxmhUAZuQ@mail.gmail.com>
From: Manuel Torres <manuel.torres.fernandez@gmail.com>
To: Enrico <ebutera@users.sourceforge.net>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Video encoding on OMAP4430
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
X-List-Received-Date: Thu, 25 Sep 2014 15:58:04 -0000
Content-Type: multipart/alternative; boundary=f46d043891ffd1db4c0503e5dc2a

--f46d043891ffd1db4c0503e5dc2a
Content-Type: text/plain; charset=UTF-8

Which console image should I build? The Arago or the Gumstix one?

On Thu, Sep 25, 2014 at 5:33 PM, Enrico <ebutera@users.sourceforge.net>
wrote:

> On Thu, Sep 25, 2014 at 4:31 PM, Manuel Torres
> <manuel.torres.fernandez@gmail.com> wrote:
> > First of all, thank you for taking the time to help me.
> >
> > Now, back on topic: should I download the "meta-arago-extras" layer?
> That is
> > what I found on Google when I searched for "gst-plugins-ducati".
>
> You should just follow the steps to build latest arago, build a simple
> console-image and if everything is ok you can go on building gstreamer
> and the ducati plugin.
> You will need meta-gumstix of course.
>
> Enrico
>

--f46d043891ffd1db4c0503e5dc2a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Which console image should I build? The Arago or the Gumst=
ix one?<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Sep 25, 2014 at 5:33 PM, Enrico <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ebutera@users.sourceforge.net" target=3D"_blank">ebutera@users.sourcef=
orge.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On Thu, Sep 25, 2014 at 4:31 PM, Manuel Torres<br>
&lt;<a href=3D"mailto:manuel.torres.fernandez@gmail.com">manuel.torres.fern=
andez@gmail.com</a>&gt; wrote:<br>
&gt; First of all, thank you for taking the time to help me.<br>
&gt;<br>
&gt; Now, back on topic: should I download the &quot;meta-arago-extras&quot=
; layer? That is<br>
&gt; what I found on Google when I searched for &quot;gst-plugins-ducati&qu=
ot;.<br>
<br>
</span>You should just follow the steps to build latest arago, build a simp=
le<br>
console-image and if everything is ok you can go on building gstreamer<br>
and the ducati plugin.<br>
You will need meta-gumstix of course.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Enrico<br>
</font></span></blockquote></div><br></div>

--f46d043891ffd1db4c0503e5dc2a--
