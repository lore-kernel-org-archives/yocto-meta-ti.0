Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 17430E00781; Thu, 14 Aug 2014 07:08:04 -0700 (PDT)
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
	*      [209.85.192.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1A4DE0074B
	for <meta-ti@yoctoproject.org>; Thu, 14 Aug 2014 07:08:00 -0700 (PDT)
Received: by mail-qg0-f41.google.com with SMTP id q107so1067980qgd.28
	for <meta-ti@yoctoproject.org>; Thu, 14 Aug 2014 07:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TQFdvd5DxnDnvf7cfKL2vrY5vtd8C2swLG75wrE8peo=;
	b=zazvSMyZAEz23F157AUP4rXf6GdhK2ussFVp7Cgc55Vg1EyxDHfVWu3Rpayy57i3Ff
	xwOtgGm1UDPwEsjMKmg0sv8CDMPaT29QvkxvoPjxEJMGOOZfSDvNlNNsvXSL9IKeOluV
	8aDWqoYiN4b1LYlpkhtUiLurmIai4M6DHbgXFFaALZr7NzFHYs/fH1D8k/wKpnYcrUEf
	w/HYIOB64mKLyT+rBZAY7qH87RFmu7XxxkFKr+67S3IgUt6K3KpLDVoG6JtNRyz3wv1H
	MfqZYzf7c2SMnQMmhU9ZQ5uHHn/Pf2xBLNoIxUTlqncnzIZHK5Fea8lWJkryeoQ37DYx
	w2Ug==
X-Received: by 10.229.233.70 with SMTP id jx6mr17486168qcb.31.1408025279582;
	Thu, 14 Aug 2014 07:07:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.83 with HTTP; Thu, 14 Aug 2014 07:07:39 -0700 (PDT)
In-Reply-To: <20140814140331.GW23523@edge>
References: <53ECBC66.4070509@pseudoterminal.org> <20140814140331.GW23523@edge>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 14 Aug 2014 11:07:39 -0300
Message-ID: <CAMCfZKG1yX1usuAFGeCKUvVpejy9k9TGRy-2QnieJHCpUKsH_g@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Beaglebone Black and libgles-omap3 : build problem
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
X-List-Received-Date: Thu, 14 Aug 2014 14:08:04 -0000
Content-Type: multipart/alternative; boundary=001a1134a4049fda5e0500976ef1

--001a1134a4049fda5e0500976ef1
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On Thu, Aug 14, 2014 at 11:03 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> Don't use beaglebone machine from meta-yocto-bsp, but instead use
> beaglebone
> machine from meta-ti, if you want to use other components from meta-ti...
>

Just complementing. Remove meta-yocto-bsp from your bblayers.conf

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a1134a4049fda5e0500976ef1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi,</div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Thu, Aug 14, 2014 at 11:03 AM, Denys=
 Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=
=3D"_blank">denys@ti.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":2y0" class=3D"a3s" style=3D"over=
flow:hidden">Don&#39;t use beaglebone machine from meta-yocto-bsp, but inst=
ead use beaglebone<br>


machine from meta-ti, if you want to use other components from meta-ti...</=
div></blockquote></div><br>Just complementing. Remove meta-yocto-bsp from y=
our bblayers.conf</div><div class=3D"gmail_extra"><br clear=3D"all"><div><d=
iv dir=3D"ltr">

<div>Regards,</div><div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administ=
rador do Embarcados<br><a href=3D"http://www.embarcados.com.br/?utm_source=
=3Dassinatura_diego&amp;utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%2=
0Email%20Diego" target=3D"_blank">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a1134a4049fda5e0500976ef1--
