Return-Path: <fromm@dresearch-fe.de>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAA2BE01304
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2012 06:31:27 -0700 (PDT)
Received: by bkcjf20 with SMTP id jf20so6636503bkc.35
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2012 06:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=VO/rLw4FIfziNGjXvd/W/vLNp6WgsL76XsKzoI6lPkc=;
	b=W68i8quR/l37fOrk9WnN5iB87l+mrt06gE5GZV6t5cLFrCCl6GzuyHKqDYF+SEQFGB
	4Su6RsqrllgDHWIEDoglE2JCEszLEued5anh/5TMi3tCtDFxQuqkrfNRdiFS56OTdlrz
	NSOliFcPOM1nDlp2/dOcJErC+xtW53wYX27ZJ3ei+pbcYIovsd3fweAeLAusxLw016E6
	ULFncQ/bW+coakNLja6PqHK6XwH3Dvh8gT/bOoGdTgn0wVWfrZfu+Xt7q/1kbznb8ELn
	RjbkVdiANPJGwtzFIXtWQnNpZZ8kznqrUSFgIEuhNUSYqTNqEbDt17OitOgqptuiFCN4
	92DA==
MIME-Version: 1.0
Received: by 10.152.122.9 with SMTP id lo9mr4292163lab.41.1340112685886; Tue,
	19 Jun 2012 06:31:25 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Tue, 19 Jun 2012 06:31:22 -0700 (PDT)
In-Reply-To: <20120612011706.GD30300@denix.org>
References: <20120612011706.GD30300@denix.org>
Date: Tue, 19 Jun 2012 15:31:22 +0200
Message-ID: <CADZ6=avUy_QP2E7cgDuU9redCXyb8JNzWhFhwMxXC10NiSSMYw@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Denys Dmytriyenko <denis@denix.org>
X-Gm-Message-State: ALoCoQnXA/Ber92DBM29U2Jcgpr/9FspUaeFX1LzdSyvLVUUEO4D9gwMAnd7WwAf/bvYzyFEOtSO
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
X-List-Received-Date: Tue, 19 Jun 2012 13:31:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Denys,

> This is a RFC for creating an additional "extras" layer inside meta-ti to
> contain pieces and components that are either slightly outdated (i.e. old
> Davinci boards, hawk/crane etc.) or have best-effort status (TI81x, anyth=
ing
> DSP-related, etc.) or require non-standard dependencies besides OE-Core
> (systemd?) with the possibility of moving them back to "main" meta-ti in =
the
> future, once they become "first-class citizens", i.e. gain current and
> continuing support.

Denys, did you just imply that ti81x has no current and continuing
support? I'm just curious because our TI field application engineer
keeps telling us that it is fully supported and will receive a kernel
update soon.

Can you please go into detail on what platforms will be supported in the fu=
ture?

> The initial split (which is still "work in progress"), following the abov=
e
> description (except the systemd for now) can be checked at:
>
> http://arago-project.org/git/?p=3Dmeta-ti.git;a=3Dshortlog;h=3Drefs/heads=
/split
>
> I do understand this is, like any other restructuring, an invasive change=
, but
> is required to properly position "meta-ti" and the support behind it. I'm=
 open
> to a discussion and any constructive criticism - feel free to comment. Th=
anks.

From a platform perspective your split makes a lot of sense imho.
Especially if there is no active maintenance (let alone development)
for the "extras" platforms. The euphemistic choice of naming puzzles
me, though. I take it that by "extras" you actually mean "deprecated"
or "unmaintained"? If so then please consider naming it that way.
"extras" really suggests some added sugar to the "core" recipes of
meta-ti, which doesn't really coin what you intend to do with it. If
you need to be euphemistic please at least choose a name in the right
context, like something along the lines of "attic", or "basement".

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

