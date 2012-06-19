Return-Path: <fromm@dresearch-fe.de>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37D3CE01304
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2012 07:17:37 -0700 (PDT)
Received: by lboj14 with SMTP id j14so7147380lbo.35
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2012 07:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=QASY7JogwZEuGuQrC2d+VZlQRSQQsdXGOHuR7KOUeuI=;
	b=I+JX1vv/CHEQ26RDDKLlzoKQvxUcz1rJI6fFwEZA5k/y+eI284up4G23RjMDdSzLfz
	5QerIqpUGMEL1NcBBNYRebVs0kYSml6z9LsS79+sIQEHkvnXOnV6XhmQ2VWeS8OXrWk3
	1GmcnZw6A6EsfFqNAUz+JjsKcVUEuuptaDaqHei6vqO9qVVtkg4aXw0nBuKiJQl1pVLu
	F2Of1LQyPd3pRv82xbPJw8sEK6lkasgjG/pyK8mxDuk3Qtw0uU+tNM3fMHAe+A+gVmFn
	86htLViC0II8K2pWRIj6WEv/+1a5YiiE0lNvZDzuaIUxs7Dao12OKoGLcxOo5lhNBXKU
	ApbQ==
MIME-Version: 1.0
Received: by 10.152.102.234 with SMTP id fr10mr18842801lab.32.1340115455614;
	Tue, 19 Jun 2012 07:17:35 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Tue, 19 Jun 2012 07:17:35 -0700 (PDT)
In-Reply-To: <20120611212503.GB30300@denix.org>
References: <4FD5FD69.8030604@dresearch-fe.de>
	<20120611212503.GB30300@denix.org>
Date: Tue, 19 Jun 2012 16:17:35 +0200
Message-ID: <CADZ6=at_4q-c0rHdZeb6_sF3Q2YojkZX5We8ZORrdc1cht8H6g@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Denys Dmytriyenko <denis@denix.org>
X-Gm-Message-State: ALoCoQl1qrjqDuuYUzgPiOEqveX0P6xILMFrEoTT/iCKCPKXS+4J8s2MTXOGpDTRh863QCum2K2J
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Tracking of Texas Instruments DM81xx related bugs
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
X-List-Received-Date: Tue, 19 Jun 2012 14:17:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Denys,

>> Because Texas Instruments is not able or willing to provide a useful iss=
ue
>> tracker (not even for commercial customers like our company) we decided =
to
>
> Steffen,
>
> That is because meta-ti is not a Customer Support channel. If you, as a
> commercial customer, have issues with TI products, please use one of the =
many
> means of contacting the official TI Customer Support:
> http://www.ti.com/general/docs/dsnsuprt.tsp

Denys, you cut off Steffens quote. As he wrote we have an abysmal
experience using all of the many means available to us of contacting
TI as a customer. We do not consider this mailing list being another
means of requesting support from TI. We are using the list to reach
out to other customers in the TI developer community. We are under the
impression that others share our experience of working with TI, and of
making any sense with ti81xx platform "support". This thread exists
because we think other readers of this list might be affected. So
please understand that we are not trying to request support from the
mailing list. We would like to address other customers of TI which had
a similar experience, and point them to the issue tracker.

> On the other hand, meta-ti is a community project to integrate existing
> components for TI "Embedded Processor" platforms into a BSP layer for
> OpenEmbedded-Core and Yocto Projects.

If this really is true then you communicate the fact rather badly. The
layer index at <http://www.openembedded.org/wiki/LayerIndex> states
that meta-ti is TI's official BSP layer. "official" in this context
means, according to openembedded.org: "Note: machine support layers
are unofficial and not manufacturer-supported unless noted otherwise."
meta-ti *does* note otherwise. Also, the README in meta-ti states "The
official OpenEmbedded/Yocto BSP layer for Texas Instruments
platforms.".

That's contradictory. So what *is* meta-ti then?

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

