Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9CD58E007F6; Mon, 18 Aug 2014 05:35:21 -0700 (PDT)
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
	*      [209.85.216.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4CACE007EE
	for <meta-ti@yoctoproject.org>; Mon, 18 Aug 2014 05:35:19 -0700 (PDT)
Received: by mail-qa0-f46.google.com with SMTP id v10so4248701qac.5
	for <meta-ti@yoctoproject.org>; Mon, 18 Aug 2014 05:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JCKNjodVhasB4SgPqLSNRIQCyj9DbIzolQptksY3Vdw=;
	b=LSjr234mn7WoIFyCnL1K9DU+1T29mxCz/elx7/xbgPUHGx85sh5Sc85VnXYX+26YOk
	V+H5GqYm40vXPiDCQ07e1sxs/siIRnN7ohBiSqC5DJTnYANqZz9NqhT5OHqpW/L2AigU
	dTqNPXV5QxUxUZG9F8WGzCtGkDEL3GAUQancnqHW58f3N1INXSR7qRGu0RqryDtZKehF
	cweGg4TwWSbOyD8Exk61S2xgvKEB5Ru2Y3SQShGf2MVpo8GQWUXTarq+jlkTTi/SAAck
	GR7hLxjWhdKyErBmC/8IV/sTyoqXDN099gBcvqR063RxHzl1EViey7tBfK+wXi93pQ7T
	PGCw==
X-Received: by 10.140.16.194 with SMTP id 60mr5401558qgb.105.1408365318910;
	Mon, 18 Aug 2014 05:35:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.83 with HTTP; Mon, 18 Aug 2014 05:34:58 -0700 (PDT)
In-Reply-To: <8239334.zKDPeKpJDo@localhost.localdomain>
References: <53ED13BE.2090809@pseudoterminal.org>
	<2948184.BeJYLBqp38@localhost.localdomain>
	<53F1C2F5.50209@pseudoterminal.org>
	<8239334.zKDPeKpJDo@localhost.localdomain>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Mon, 18 Aug 2014 09:34:58 -0300
Message-ID: <CAMCfZKFSUXqmrSP4evQyHQkRC1ygXVTROxJstDjJTDXtsAQatw@mail.gmail.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: BeagleBone Black , u-boot, and zImage
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
X-List-Received-Date: Mon, 18 Aug 2014 12:35:21 -0000
Content-Type: multipart/alternative; boundary=001a11c0a6548c3bea0500e69a7c

--001a11c0a6548c3bea0500e69a7c
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 18, 2014 at 9:28 AM, Maciej Borzecki <
maciej.borzecki@open-rnd.pl> wrote:

> Rough guess, but it looks like a default u-boot from eMMC. Try following
> official instruction to make it boot off SD card:
> https://www.yoctoproject.org/downloads/bsps/daisy16/beaglebone
>

This should do the trick:
"Pressing the USER/BOOT button when powering on will temporarily change the
boot order".


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c0a6548c3bea0500e69a7c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Aug 18, 2014 at 9:28 AM, Maciej Borzecki <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:maciej.borzecki@open-rnd.pl" target=3D"_blank">maciej.borzeck=
i@open-rnd.pl</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":kjx" class=3D"" style=3D"overflow:hidden">Roug=
h guess, but it looks like a default u-boot from eMMC. Try following<br>


official instruction to make it boot off SD card:<br>
<a href=3D"https://www.yoctoproject.org/downloads/bsps/daisy16/beaglebone" =
target=3D"_blank">https://www.yoctoproject.org/downloads/bsps/daisy16/beagl=
ebone</a><div class=3D""><div id=3D":kdb" class=3D"" tabindex=3D"0"></div><=
/div></div>

</blockquote></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">This should do the trick:</div><div class=3D"gmail_extra">&quot;Pre=
ssing the USER/BOOT button when powering on will temporarily change the boo=
t order&quot;.<br>

</div><br><br clear=3D"all"><div><div dir=3D"ltr"><div>Regards,</div><div><=
br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a=
 href=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;ut=
m_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"=
_blank">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c0a6548c3bea0500e69a7c--
