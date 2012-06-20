Return-Path: <fromm@dresearch-fe.de>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A0BEE0070C
	for <meta-ti@yoctoproject.org>; Wed, 20 Jun 2012 00:12:10 -0700 (PDT)
Received: by lboj14 with SMTP id j14so208359lbo.35
	for <meta-ti@yoctoproject.org>; Wed, 20 Jun 2012 00:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=atQ+wxiSPsO3bR3qTE2o+ueoHMRO2Afpc5bfJH0vKS4=;
	b=VTysqQlMgeDlAoFflz5JgMVr2a7M5zPpMYmgsPFfCm6Ij3m7uQaDXmQNhQ6iXgIfAY
	bs3yDJBW5zoU/QEB0zi5FtzXLYBEalUnCXkREzhxsL5vTmt3TTxhEPgyfRcUbdGanXa4
	3b+0/hOOWEdQ/DYsoy3MKEb/NFzpC9Hxfxbbtlbn8UGmjcx8tAIdsi1kv3ebYpFCoYsr
	ZY5wneGQi/VXDu3+c3QA5bBBuR+AvP0fKK/+t9sKYATvgwwDvx6SaBCBrSkDm3bG4svo
	0yepJroQq6gYe9MH1f2vWctffGxnrKP7RAn/+z1XGbZVS3XmgnEZHx84sPNyN0VCR6My
	q2TA==
MIME-Version: 1.0
Received: by 10.152.102.234 with SMTP id fr10mr21510401lab.32.1340176329368;
	Wed, 20 Jun 2012 00:12:09 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Wed, 20 Jun 2012 00:12:09 -0700 (PDT)
In-Reply-To: <CA+T6QPkvE=AvpDOQJ4TR9ETadxWpyv0VVd4Z5eVVLNY2AxfymA@mail.gmail.com>
References: <20120612011706.GD30300@denix.org>
	<CADZ6=avUy_QP2E7cgDuU9redCXyb8JNzWhFhwMxXC10NiSSMYw@mail.gmail.com>
	<CA+T6QPkvE=AvpDOQJ4TR9ETadxWpyv0VVd4Z5eVVLNY2AxfymA@mail.gmail.com>
Date: Wed, 20 Jun 2012 09:12:09 +0200
Message-ID: <CADZ6=asjiF6zr6QrPJa=H0g++RnL9xY21w_poW=Ab9tRFi=2_g@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Jason Kridner <jkridner@beagleboard.org>
X-Gm-Message-State: ALoCoQnQHsOMR992Ckj1MPI1+o7jwf42dr/wG7W9NzFGaX4h/GhQ3CaYzj4yLAEe3jUKBP9Um+85
Cc: meta-ti@yoctoproject.org
Subject: Re: RFC: creating "extras" layer
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
X-List-Received-Date: Wed, 20 Jun 2012 07:12:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Jason,

>> From a platform perspective your split makes a lot of sense imho.
>> Especially if there is no active maintenance (let alone development)
>> for the "extras" platforms. The euphemistic choice of naming puzzles
>> me, though. I take it that by "extras" you actually mean "deprecated"
>> or "unmaintained"? If so then please consider naming it that way.
>> "extras" really suggests some added sugar to the "core" recipes of
>> meta-ti, which doesn't really coin what you intend to do with it. If
>> you need to be euphemistic please at least choose a name in the right
>> context, like something along the lines of "attic", or "basement".
>
> I believe this interpretation is a good reason not to make this split
> at this time. =C2=A0While I appreciate that some platforms will have more
> resources given to updates at various times than others, I don't
> believe this split generates an easy-to-grok understanding of the
> platform status. =C2=A0I'd suggest providing links to automated test
> reports and something akin to a MAINTAINERS file for a better
> indication of platform/recipe status/ownership.

I feel this would obfuscate the state of support for different TI
platforms even further. Denys made a technological decision which
makes sense. Your arguments against the split are more likely to be
driven by marketing. Not separating the platforms even now when we
have statements about which platform will receive support in the
future and which would not really does not help transparency. Finding
platform support recipes within a "meta-deprecated/" sub-layer is way
more telling than having a note way down a README or a MAINTAINERS
file.

As Denys noted, every platform which is supported can be moved out of
the new meta-layer and back into its original place anytime. If you
don't like a platform being in "extras/" (or, better,
"meta-deprecated/"), just start supporting it.

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle

