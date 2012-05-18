Return-Path: <fromm@dresearch-fe.de>
Received: from mail-lpp01m010-f48.google.com (mail-lpp01m010-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BDB54E01422
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 05:53:47 -0700 (PDT)
Received: by lagz14 with SMTP id z14so2855982lag.35
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 05:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=RhEORdNQjter+giKWX8fZoz4B/9stZlkjS8BGWolByk=;
	b=ZUfQfYh2aF332UZ+Xo5a0U4a5/Rq8OjSNr+6MNTjdaYICoFHAM0yb0cprIfHHzWdwn
	OLb9JgOaH2Trfu+NaXkqoAiPw43Fe468LnuiI0OSs83NvW6Kg5JKP9t7o9rdYRdz5uAx
	1E3IC771IJYCmbfoFCvmID+vJFwn4sV1GFv8g+o/Kdu6NUXSmjNbapULlEjCEIsuYdyt
	2+yIWkENaCDPfYWQ0k0P0SeFwi1xaDhKhOgKzqH3qIU/wxNb7AV+sHk7p29NAypcu8T/
	UL7YWH2TJehvqacy2EaLf8PwkGB0D92KY/Fk1YvYiqcvVrG7zr4tsFfLoUS0nZlOFBzP
	CpUw==
MIME-Version: 1.0
Received: by 10.152.146.129 with SMTP id tc1mr10869985lab.27.1337345626589;
	Fri, 18 May 2012 05:53:46 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Fri, 18 May 2012 05:53:46 -0700 (PDT)
In-Reply-To: <jp5gkp$2ip$1@dough.gmane.org>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
Date: Fri, 18 May 2012 14:53:46 +0200
Message-ID: <CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQno7Kd3vpH9oJK+s01PNxufahMpuGRyNOlqcFhpyL0ojzUU4CG6MJ4GXxFItx+FlcEM1+7U
Cc: meta-ti@yoctoproject.org
Subject: Re: [oe] ti81xx-psp-linux-2.6.37: broken kernel with gcc > 4.5
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
X-List-Received-Date: Fri, 18 May 2012 12:53:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Koen,

>> sorry for the cross-post (openembedded-devel, meta-ti), I think this
>> affects both projects one way or the other.
>>
>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5. This means
>> with oe-core + meta-oe you now can choose between gcc-4.6 and gcc-4.7.
>> However, both compilers break the kernel we're using
>> (ti81xx-psp-linux-2.6.37).
>
> What happens when you disable the mailbox? AIUI you shouldn't need that o=
n
> Ne/Ce.

How do I disable the mailbox? What do you mean by Ne/Ce?

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

