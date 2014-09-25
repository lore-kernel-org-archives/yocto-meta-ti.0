Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 134D0E0086E; Thu, 25 Sep 2014 05:05:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (diego.sueiro[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27E55E0086A
	for <meta-ti@yoctoproject.org>; Thu, 25 Sep 2014 05:05:20 -0700 (PDT)
Received: by mail-qa0-f50.google.com with SMTP id j7so4502515qaq.9
	for <meta-ti@yoctoproject.org>; Thu, 25 Sep 2014 05:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=21/oUz5B8QP293U9ce8Eh7NfJAOtNx+jn5Ls04LFrn8=;
	b=Wio0cAr3eHU55i300g0er9qNbFMLJZRtLqefHqg9szqLlwO+bLCjOyILdospd7Q1hv
	DmIp+XJ8Y/khzWBDovLJwwPullEsiRqknWM5bBNIohlN0Pn4/0ujpOLpxxAjQi/9xfDU
	YfFB5yVrvZ8J+70ncOW5WQ7h8VqRlfsdsakEUKiGaoMZJuGQw+emNUVtUN2h3z5PxRzD
	anrmm3xgObh9vC64rTOIaDp3el5G10qAHHHaEP9VreznLaPELpn+uwvGqnTenNO9U0Aw
	7hdMBebBogQN29FIuJ/9X3z7iwYH+pG0K1ZxrzzxoGYDxmz6tvwTJHi0L3aKqIfxmnvY
	HmLA==
X-Received: by 10.140.16.194 with SMTP id 60mr10007528qgb.105.1411646719615;
	Thu, 25 Sep 2014 05:05:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.83 with HTTP; Thu, 25 Sep 2014 05:04:58 -0700 (PDT)
In-Reply-To: <20140924155211.GZ6303@edge>
References: <1411405491-30435-1-git-send-email-denis@denix.org>
	<CAMCfZKHU6GkJMrKBUHJbPttyoKvnb0xqDAEHxysi-W-B1U3scQ@mail.gmail.com>
	<20140924155211.GZ6303@edge>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 25 Sep 2014 09:04:58 -0300
Message-ID: <CAMCfZKGPy3mLD_4_4ZJCHQs-=3HjvMk6KkD8Z8_HFhi=jmMhVw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-ti-staging: update to 3.14.19 with latest fixes
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
X-List-Received-Date: Thu, 25 Sep 2014 12:05:26 -0000
Content-Type: multipart/alternative; boundary=001a11c0a6544568b60503e29d88

--001a11c0a6544568b60503e29d88
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 24, 2014 at 12:52 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> Do you need to submit a bug report? Is it for kernel or some other
> component?


Not at all.
Just thinking about to have a place where I can easily track issues, solved
bugs and enhancements for both kernel and u-boot projects. I wish I could
have an idea on what to expect from TI's work.

The gitorious web interface is the worst available for opensource projects.


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c0a6544568b60503e29d88
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Sep 24, 2014 at 12:52 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<=
a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Do you need to submit a bug repo=
rt? Is it for kernel or some other component?</blockquote></div><br>Not at =
all.</div><div class=3D"gmail_extra">Just thinking about to have a place wh=
ere I can easily track issues, solved bugs and enhancements for both kernel=
 and u-boot projects. I wish I could have an idea on what to expect from TI=
&#39;s work.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">The gitorious web interface is the worst available for opensource pr=
ojects.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
"><br clear=3D"all"><div><div dir=3D"ltr"><div>Regards,</div><div><br></div=
>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href=3D=
"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;utm_medium=
=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"_blank">=
www.embarcados.com.br</a><br><br>/*long live rock &#39;n roll*/<br></div></=
div>
</div></div>

--001a11c0a6544568b60503e29d88--
