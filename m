Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4CDE5E00559; Wed, 25 Jun 2014 05:42:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (diego.sueiro[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.170 listed in list.dnswl.org]
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 463FAE003FA
	for <meta-ti@yoctoproject.org>; Wed, 25 Jun 2014 05:42:10 -0700 (PDT)
Received: by mail-qc0-f170.google.com with SMTP id l6so1641681qcy.15
	for <meta-ti@yoctoproject.org>; Wed, 25 Jun 2014 05:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7V25SrHYfdqxwfzF6pca6d7BoyvO9sZGlyOU0kZGOL4=;
	b=R1PRBppBC2irppcqtiohPvI8FLQQuav64R7W/DiixSSsyvdoiolQGH5S7o0JzeTSiv
	mlWGWyW4uzsZFQMRrYDlTbwa2M4b2vqWBc3aYXWLdfkrzIdh1tniy6gNjINvPUVfbvON
	t0W3AEudrfUnPVa5KT9QjZs4IF/XTKagl1dlaI/Hfk0CX+hSsKUMXbggx/vLWFxumrst
	bM4gsYTOanNgS4q1LV3ssyxhm8JY0nqew/e7LgBwdWDwPMCbaUGKFBwqfqY4OboRVF5o
	7ZOW3j985CXQ0zvIQcPkEAnNRBkSDkxmWhLv65ap81XPD8WRc3pm2xmf2jw0mHR7pPUK
	O8kA==
X-Received: by 10.224.138.9 with SMTP id y9mr11444958qat.1.1403700129897; Wed,
	25 Jun 2014 05:42:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.112 with HTTP; Wed, 25 Jun 2014 05:41:49 -0700 (PDT)
In-Reply-To: <20140624230443.GP6700@edge>
References: <CAMCfZKH23Ow_q1MQPi3Hu3oGjTGqpJ=CyO5kXYXoK3uoE-55qA@mail.gmail.com>
	<20140624230443.GP6700@edge>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Wed, 25 Jun 2014 09:41:49 -0300
Message-ID: <CAMCfZKFpsX+SHevjZwQ5o5xkFxVeqS5G5FCuDY1ZUyZMZAsJSg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: omap3-sgx-modules fails on do_compile
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
X-List-Received-Date: Wed, 25 Jun 2014 12:42:22 -0000
Content-Type: multipart/alternative; boundary=001a11c200269d25ca04fca867b8

--001a11c200269d25ca04fca867b8
Content-Type: text/plain; charset=ISO-8859-1

Hi Denys,

On Tue, Jun 24, 2014 at 8:04 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> Graphics SDK 5.01.01.01 doesn't work with kernel 3.14 yet.
>
> The last tested kernel version to work with Graphics SDK was 3.12; and 3.14
>
has changed some APIs, hence the breakage.
>

I've updated meta-ti repo and it works now.

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c200269d25ca04fca867b8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Denys,</div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Tue, Jun 24, 2014 at 8:04 PM, =
Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" tar=
get=3D"_blank">denys@ti.com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div style=3D"overflow:hidden">Graphics SDK =
5.01.01.01 doesn&#39;t work with kernel 3.14 yet.<br>
<br>
The last tested kernel version to work with Graphics SDK was 3.12; and 3.14=
</div></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"overflow:hi=
dden">



has changed some APIs, hence the breakage.<br></div></blockquote></div><br>=
I&#39;ve updated meta-ti repo and it works now.<br><br clear=3D"all"><div><=
div dir=3D"ltr"><div>Regards,</div><div><br></div>--<br>*dS<br>Diego Sueiro=
<br>

<br>Administrador do Embarcados<br><a href=3D"http://www.embarcados.com.br/=
?utm_source=3Dassinatura_diego&amp;utm_medium=3De-mail&amp;utm_campaign=3DA=
ssinatura%20Email%20Diego" target=3D"_blank">www.embarcados.com.br</a><br>
<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c200269d25ca04fca867b8--
