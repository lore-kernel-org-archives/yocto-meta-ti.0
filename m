Return-Path: <manuel.torres.fernandez@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A443E0076C; Thu, 25 Sep 2014 07:31:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (manuel.torres.fernandez[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [74.125.82.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BCA2E0074B
	for <meta-ti@yoctoproject.org>; Thu, 25 Sep 2014 07:31:12 -0700 (PDT)
Received: by mail-we0-f175.google.com with SMTP id u57so7249052wes.20
	for <meta-ti@yoctoproject.org>; Thu, 25 Sep 2014 07:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jT2z9xZU7J/uJwpyvOVMinzVab75CWTcRxu7x3XIMeM=;
	b=RRUlKGXj00jLJTtGqN4c2RsFPl/HBllIvANxSpUN/GNEasb7q3YDN/R8WDsOUt+Khq
	wPVMxQa4PugFCJuod8GmS1NK0Nf37aHbVLAivc39fO9GDXeHrAzef5Xsp9wYLgl0kDN8
	Te/YNmR9rU4Gd1/9bGdvJ3M5G9r4W6mhFiUEHqGbOBAZZPJCINfoexbfthyTh16JiiYb
	jpTG9dbC2vtBwNbNUZ2DvEJNFSDrZzz+ryvA9SZcSjk84BABqwExiwB5mEJcbI4F1w2P
	7WlmM/Rp0ayWFh9ccbgs7Z0dBXJdnF31jdkCSFlPdkSF2uD9kyNXVrkmQSES14xOai+0
	e0aw==
MIME-Version: 1.0
X-Received: by 10.180.81.195 with SMTP id c3mr9889972wiy.11.1411655471374;
	Thu, 25 Sep 2014 07:31:11 -0700 (PDT)
Received: by 10.27.8.138 with HTTP; Thu, 25 Sep 2014 07:31:11 -0700 (PDT)
In-Reply-To: <CA+2YH7t7PVNKA6xT1QcCgGoPY_foe020_sxWk5dJYhmLqi8QYA@mail.gmail.com>
References: <CAF+2n7Tr+tqEq_R2cr0SuUQ8+PDB5tQKeCW2GLr=RW+-W35o_Q@mail.gmail.com>
	<CA+2YH7t7PVNKA6xT1QcCgGoPY_foe020_sxWk5dJYhmLqi8QYA@mail.gmail.com>
Date: Thu, 25 Sep 2014 16:31:11 +0200
Message-ID: <CAF+2n7QzdBhtZxJ6oi11KaUovc2PiWpN=Q4gBBm28tMjm3efXw@mail.gmail.com>
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
X-List-Received-Date: Thu, 25 Sep 2014 14:31:22 -0000
Content-Type: multipart/alternative; boundary=f46d044401ceeaa8780503e4a66f

--f46d044401ceeaa8780503e4a66f
Content-Type: text/plain; charset=UTF-8

First of all, thank you for taking the time to help me.

Now, back on topic: should I download the "meta-arago-extras" layer? That
is what I found on Google when I searched for "gst-plugins-ducati".

On Thu, Sep 25, 2014 at 2:57 PM, Enrico <ebutera@users.sourceforge.net>
wrote:

> On Wed, Sep 24, 2014 at 10:53 AM, Manuel Torres
> <manuel.torres.fernandez@gmail.com> wrote:
> > Hello everyone,
> >
> > I am using a Gumstix Duovero Zephyr, which is based on OMAP4430, and I
> would
> > like to use the OMAP video encoding capabilities.
> >
> > I got this working with a Gumstix Overo IronStorm by adding
> "gstreamer-ti"
> > to the image recipe but, if I run this target with "duovero" as machine,
> I
> > get the following error:
>
> gstreamer-ti is the recipe for omap3/dm3xx platforms, with omap4 you
> should use gst-plugins-ducati but i don't know if it has been tested
> on omap4 and/or omap5.
>
> Enrico
>

--f46d044401ceeaa8780503e4a66f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>First of all, thank you for taking the time to help m=
e.<br><br></div><div>Now, back on topic: should I download the &quot;meta-a=
rago-extras&quot; layer? That is what I found on Google when I searched for=
 &quot;gst-plugins-ducati&quot;.<br></div></div><div class=3D"gmail_extra">=
<br><div class=3D"gmail_quote">On Thu, Sep 25, 2014 at 2:57 PM, Enrico <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:ebutera@users.sourceforge.net" target=
=3D"_blank">ebutera@users.sourceforge.net</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><span class=3D"">On Wed, Sep 24, 2014 at 10:53 AM, M=
anuel Torres<br>
&lt;<a href=3D"mailto:manuel.torres.fernandez@gmail.com">manuel.torres.fern=
andez@gmail.com</a>&gt; wrote:<br>
&gt; Hello everyone,<br>
&gt;<br>
&gt; I am using a Gumstix Duovero Zephyr, which is based on OMAP4430, and I=
 would<br>
&gt; like to use the OMAP video encoding capabilities.<br>
&gt;<br>
&gt; I got this working with a Gumstix Overo IronStorm by adding &quot;gstr=
eamer-ti&quot;<br>
&gt; to the image recipe but, if I run this target with &quot;duovero&quot;=
 as machine, I<br>
&gt; get the following error:<br>
<br>
</span>gstreamer-ti is the recipe for omap3/dm3xx platforms, with omap4 you=
<br>
should use gst-plugins-ducati but i don&#39;t know if it has been tested<br=
>
on omap4 and/or omap5.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Enrico<br>
</font></span></blockquote></div><br></div>

--f46d044401ceeaa8780503e4a66f--
