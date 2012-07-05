Return-Path: <fromm@dresearch-fe.de>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17F63E006B1
	for <meta-ti@yoctoproject.org>; Thu,  5 Jul 2012 02:29:46 -0700 (PDT)
Received: by lboj14 with SMTP id j14so13512998lbo.35
	for <meta-ti@yoctoproject.org>; Thu, 05 Jul 2012 02:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=sFtJvxWuXKizavZwYAsUQHcrg4beaeH1fMrLVeXGZOg=;
	b=KrpghH1I4/wUKLz92IK3OICRF0oIaE2/b2CphOn6McY8tJyPiclA6S9ASSyc9rTzp7
	3ugwRz1VnA4YJoFUmVLxe/acwUHo029xm63eXI0KLDc091tgClhWS9U7pBy8nZvGavc/
	pn5BDcPeAE/IOgM/93MOSjDZrwvjthaR2UQYWcmvVe9USgF7SC4Q9sHLB+7juE0dZnVo
	UfhwGY9sz3GyLGWpTf8qfajJ35udlBYIk1Dm/Fe45MKcnVj1RTcGmg/GXGCWBWunGR0d
	UetLqG2Cr+30tElyO3mIouJVXPXAZ6d2Hl770/I4KwGFq70YzNdqEawr+ryPMAlDnl08
	y2lg==
MIME-Version: 1.0
Received: by 10.112.85.225 with SMTP id k1mr11533590lbz.38.1341480584346; Thu,
	05 Jul 2012 02:29:44 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Thu, 5 Jul 2012 02:29:44 -0700 (PDT)
In-Reply-To: <CADZ6=asq0+CsUAackcJ4JjyqS0Dtq79SCHo7ccCyhup2CDHLOQ@mail.gmail.com>
References: <CADZ6=asq0+CsUAackcJ4JjyqS0Dtq79SCHo7ccCyhup2CDHLOQ@mail.gmail.com>
Date: Thu, 5 Jul 2012 11:29:44 +0200
Message-ID: <CADZ6=aspsm_JSB-H6ziq7feL6f7ZO0uR4HppygKsKwL7uRtfBw@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: meta-ti@yoctoproject.org
X-Gm-Message-State: ALoCoQn+qbqYlG2RbYqBFd+63s/jRr7Ygu4BdH9qb/+dhvTUoi6UWK+DSQ1deb3hFlib73HS+xqf
Subject: Re: u-boot: pinned revision refers to broken u-boot for ti8148
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
X-List-Received-Date: Thu, 05 Jul 2012 09:29:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 29 June 2012 17:41, Thilo Fromm <fromm@dresearch-fe.de> wrote:
> Hi,
>
> meta-texasinstruments/recipes-bsp/u-boot/u-boot_2010.06-psp.bb pins a
> broken revision of TI's fork of U-Boot for ti8148.
> The revision pinned by the recipe, which is
> 5fcf46a405fe8e8a59a04d3cebdafd39ac0c4bd0, does not even boot the 8148
> EVM board.
>

      _
  _  / \
 / \ | |
 | | | |
 | \_| |  / \
  \__  |  | |
     | |  | |
     | |__/ |
____ |  ___/ _________________________________________
     | |                                .
     | |  .                                     -
     | |            -         .
     | |
                                 ,      ,
                                 ~\ | /`
                    ~~~~     `-.:-###*=3D-._'
                  ~~~~~~     _.-._##=3D'~.
                             '  /  =C2=B4 \  \


                <wind noise in distant background>


--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228   mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77    http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle

