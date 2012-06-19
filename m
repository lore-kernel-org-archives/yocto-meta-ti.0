Return-Path: <fromm@dresearch-fe.de>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4151E01423
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2012 07:43:27 -0700 (PDT)
Received: by lboj14 with SMTP id j14so7183548lbo.35
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2012 07:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=/peThnkzl7+mZ0PYgj4XF5iTUS9F0/+xFiyy3MOOV1k=;
	b=mhN4n1NKB7uL41yzamIt5mk1Hj3XhLer9EzdCbj4uUCiC6Dr94mcax4tMRbKZ6abvc
	wj7cXdNPY4ktIbHLNwxJcllnRhxyesMAcVf8qtGwpU4zPM/Fk81UDC0s9axsoO7QahMy
	N+HDuc4MpvRWPewli5zmgWuilVXY3LTbsKbmvOECQ+wPFyYN5XgNv3QyhMoBoEeGxaZG
	ms7gAcrKZ5ijWrZLIwOz6fpEPcu/1xUHfVCpMp136TrA2cAKnV1mc2mNEZbyXVAXqliN
	TStKafJdwhsIT+8q4BhKF1ZGwI7V1Eu2Jzvjcpd0l/OVfKzzmu8Gal7gE38N4+fONZZN
	Omiw==
MIME-Version: 1.0
Received: by 10.112.26.131 with SMTP id l3mr8375220lbg.80.1340117006467; Tue,
	19 Jun 2012 07:43:26 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Tue, 19 Jun 2012 07:43:26 -0700 (PDT)
In-Reply-To: <4C82F39BABFE6A429733A300DEBF52240B76E4EE@DNCE05.ent.ti.com>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
	<CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
	<331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
	<4C82F39BABFE6A429733A300DEBF52240B76E4EE@DNCE05.ent.ti.com>
Date: Tue, 19 Jun 2012 16:43:26 +0200
Message-ID: <CADZ6=aspkP_NQy5j7-Jdsq0rXOmROrpt4AgCkkg_HXV=0a07VA@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: "Monk, Roger" <r-monk@ti.com>
X-Gm-Message-State: ALoCoQmUHrkVyzHTDv20/ZBfZUh0H2Yqf/8hrKu7H3xv77JT/85e8YfGPDSlJKs9SuYaEYP2gM/G
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 19 Jun 2012 14:43:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Roger,

>> >>>>> sorry for the cross-post (openembedded-devel, meta-ti), I think
>> >>>>> this affects both projects one way or the other.
>> >>>>>
>> >>>>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5.
>> >>>>> This means with oe-core + meta-oe you now can choose between
>> >>>>> gcc-4.6 and gcc-4.7.
>> >>>>> However, both compilers break the kernel we're using
>> >>>>> (ti81xx-psp-linux-2.6.37).
>> >>>>
>> >>>> What happens when you disable the mailbox? AIUI you shouldn't
>> >>>> need that on Ne/Ce.
>> >>>
>> >>> How do I disable the mailbox?
>> >>
>> >> In the .config
>> >
>> > Wait wait wait, according to drivers/staging/tidspbridge/Kconfig we
>> > need OMAP_MBOX_FWK (i.e. "the mailbox") in order to use the DSP
>> > bridge. Disabling it would mean cutting off our DSP. No way.
>>
>> Are you actually using dspbridge? Or are you using dsplink or syslink?
>>
>> >>> What do you mean by Ne/Ce?
>> >>
>> >> Netra/Centaurus, dm81xx, c6a81xx, am38xx, am39xx or whatever TI is
>> calling it nowadays.
>> >
>> > We're on a "TI DaVinci DM8148", featuring a cortex-a8 combined with
>> > a C674x DSP.
>>
>> So a centaurus family SoC.
>
> Can you put some printk's in omap_mbox_register (plat-omap/mailbox.c) to =
print the list objects, in particular the mbox->name?
>
> Would also be useful to see the same in omap_mbox_get() before the call t=
o strcmp().

So did you put your printks in there and then run the code? Were you
able to reproduce the issue?

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

