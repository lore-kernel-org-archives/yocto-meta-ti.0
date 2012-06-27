Return-Path: <fromm@dresearch-fe.de>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D8FDE0073F
	for <meta-ti@yoctoproject.org>; Wed, 27 Jun 2012 07:38:20 -0700 (PDT)
Received: by lboj14 with SMTP id j14so2015691lbo.35
	for <meta-ti@yoctoproject.org>; Wed, 27 Jun 2012 07:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=8uBJnemgBk09WD/Drhgw6DtzbMYF2nVj7c3F0A8n5gw=;
	b=Ybj/xDx+uXFV9m/lwTZMy/xbwZ6ybKuBE36fbBSLsOAezTYJ0gncZGn7uEOuyqudLz
	ys6GARx5JqkOkSI5YQy/3C+GpRyHQ5aocMwn/ctLumFFt2RkSOpm+lH2GvXB5QnQf+Ci
	yRkpgreLVa69lPYaEf+p0bmbrJqkTOlCCxBhcC5jQGUjlHolRmicn7O4oJwi5UM01phi
	5WVwH2ClJDE5kskG+Go+LpeEaH0jnvl9lcATndNpPNVsYp3jOT04Fe4dgPjRGqJcyDkS
	+EbqokuVru7EFIZRX/vV0OOu0/M98tiKIvMW48igIWD+MrUMmc5TAanQ+nQF6MRnbZ/H
	uz9w==
MIME-Version: 1.0
Received: by 10.112.85.225 with SMTP id k1mr9667320lbz.38.1340807899387; Wed,
	27 Jun 2012 07:38:19 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Wed, 27 Jun 2012 07:38:19 -0700 (PDT)
In-Reply-To: <CA+2YH7vu646k8kMUS9pYfJQ6+6s5PdvTdyxJSQewztRAaFEomg@mail.gmail.com>
References: <CADZ6=asseEZTzS6dz0we4-Czbr_n2Y6Pps5UsfGagh7NV04BqQ@mail.gmail.com>
	<CA+2YH7vu646k8kMUS9pYfJQ6+6s5PdvTdyxJSQewztRAaFEomg@mail.gmail.com>
Date: Wed, 27 Jun 2012 16:38:19 +0200
Message-ID: <CADZ6=au5b5fKuhUm=4Nrsq2es66+u=X1aorgUgDLK8AZDA3mEg@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Enrico <ebutera@users.berlios.de>
X-Gm-Message-State: ALoCoQlPI4+NOtomRVucYpD/vLaMSzXXLDngZVPBmevwgrapc7rlOrO1XzDVa3K2LAuSl4vEgjtD
Cc: meta-ti@yoctoproject.org
Subject: Re: gstreamer / ti-dmai component does not build for ti8148-evm
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
X-List-Received-Date: Wed, 27 Jun 2012 14:38:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Enrico,

>> Hi,
>>
>> building gstreamer for ti8148 fails becasue DMAI does not build:
>
> Are you sure you can use gstreamer-ti with ti8148?

Apparently I cannot.

> AFAIK for
> multimedia it's more like the pandaboard so you should use gst-ducati.

... which is not part of meta-ti?

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

