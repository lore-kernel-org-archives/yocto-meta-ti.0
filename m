Return-Path: <fromm@dresearch-fe.de>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 291F1E0027D
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2012 07:47:22 -0700 (PDT)
Received: by lboj14 with SMTP id j14so5624047lbo.35
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2012 07:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=svx2OwhtK9n2FROygy5kLobh7jFUkZPLIPiaqFcaYHU=;
	b=h47gALYd1Q4jmLw6r0qGCJX+ifWA2mSkzlAXgWLCQRHX7rQroAvrmnmgpnyLHPPTiD
	vlM4EEHUvUdQKXM6PhBf9t0f8Bu11zPqUn1JuJHzfQ49Pu+hWboVPugvNSymoyWY4MXA
	jlyZe0UN8RIvqLk+1OvWpZGvFXGL0iH85H54OAREGJi6/bMKNVLKqKeEYQvx1J56KZym
	0lujhe2WSIcclKICup1Sztb95Lxq3mEG8WNcxOa93wyilOB/zLZGuFHVgr3EglPUvHVy
	Zd2QtCF0AIXK7ZyX5tj2xLmKREWhMDeHGqawT2HWodB64vIF8Ix1o+m2LgimE3cwbDsn
	urIg==
MIME-Version: 1.0
Received: by 10.112.46.166 with SMTP id w6mr933571lbm.100.1342190842046; Fri,
	13 Jul 2012 07:47:22 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Fri, 13 Jul 2012 07:47:22 -0700 (PDT)
Date: Fri, 13 Jul 2012 16:47:22 +0200
Message-ID: <CADZ6=avGWT=-4vLVs3VOW6dx1kmuo_qyP7jdkQiroM-UXZi06A@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: meta-ti@yoctoproject.org
X-Gm-Message-State: ALoCoQnhQPTZ+aRLUhd9DtY9h/gu+I02UHrK0n8iF5S3iBVJMeiWbthO0X3odAUgyzO7lSiq0I6U
Subject: netbase-4.47 vs. -5.0 build breakage
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
X-List-Received-Date: Fri, 13 Jul 2012 14:47:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi guys,

is anything happening to fix the current build breakage against
oe-core? oe-core moved on to netbase-5.0, meta-texasinstruments is
still referring to netbase-4.47 with a .bbappend. Andreas M=C3=BCller
submitted a patch on 9th of July which fixes this. Please apply the
patch; currently the meta-ti build is broken.

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228   mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77    http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle

