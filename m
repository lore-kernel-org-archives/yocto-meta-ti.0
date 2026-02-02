Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236C1E7DF1F
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 18:53:51 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60977.1770058423844136552
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Feb 2026 10:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=NVYYdQ/Z;
 spf=pass (domain: criticallink.com, ip: 209.85.128.173, mailfrom: jcormier@criticallink.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-794d05dbe22so15282067b3.3
        for <meta-ti@lists.yoctoproject.org>; Mon, 02 Feb 2026 10:53:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770058423; cv=none;
        d=google.com; s=arc-20240605;
        b=iW8Jc4l4+wQmOAkiLlPMpD+K3j7FlxS/602ljdVX+lsoLKoOXqiuGDoeoctHuTYhsB
         wc7noZoFBx1DkQF+7SbIS8HlYORN1PqLaqc1Vt1OOcXjZJlx7hMtZf1oPA02m9ocfDB2
         Q3nnDDvuGNM12DAnUJvsWEczDz2mWLn9qW5/V+eWOyTR+5Etty07Oa1IQsM2DiP9Snpx
         +4ey63wQf6RnyEMtDbkVfY812a6VxE/F1OQ5MtbqwfTpmqp4wyKIXxlDGV2Ew3oUiBv9
         P3XB+jTCZcpE1TAegv0Ldow9y7UlBmropv9NJOQrBPOJx52wjOrk1l3f4ZPMMYNS3BtV
         o87A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ePjHcEXWyigbcI6bp+Tu/+aJ4gkVzvID4lovqwFHXck=;
        fh=tbSYAoWLikc+Qs1J0N8rUBuPZtAu4KBZsX86NZa77Fc=;
        b=RV7pvzJhMpFFl3tkAV630u1SnHLkYUOSYwNBVK0pV8yBeP8tn6PTNqTMcqQQe37/ew
         ROuyANAMpUAKDb6DCGrYlhduX17wIkcjIXckS3gh9ycn2jHzBVUg/VW33WQtkAUVqCEU
         wVJ4yEIgVvj+a21GSEopXNAjr7LRCbRosC9eE763LTevlnQaepcDQI2+qgFsKnxWt9Sy
         zS7eRVktcLtyGgI+OduChxpZ8h3aG+yctq8pzd22mMJi+cDqZPoweEJ2UEpRFfHFhuCK
         Y5Kpi5MgayysF4dKK7/g0IoiEES/TBgEk2YFsieynVqQ/WWWnmlRaQR8G7lqm2+MR3ke
         TZug==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1770058423; x=1770663223; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePjHcEXWyigbcI6bp+Tu/+aJ4gkVzvID4lovqwFHXck=;
        b=NVYYdQ/Z0gHb+zB9eO8uVZzYfDDtsbAsiDZNV/qjJWAQOvApqAAiIjysIqIX9Nrdyw
         0heUIE/oWP8ryyw5EvLS9uLyBUnDC4WSboQ4XMuTb/Yzs746szhjQHu9YId+Luki3ZNq
         P2m7dno/3lURrsLh0MDESEdSn+bwjAUET/zAGyiJOBPtM+100v+zorpB3Hlvx/52cnX7
         aIvlIhDYm0IODdB+tlu/EYo6/9Si3LIHXjMrDeGTcz73ckGDzvhVgLu2M20hZr9JDWjq
         8KhcKKjmmJKUUzFmR9PXZ2qai7CnZYYiw1qTv5YCqVQIcsHhLLPYrWEMtIuTjY8AdSB8
         Zlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770058423; x=1770663223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ePjHcEXWyigbcI6bp+Tu/+aJ4gkVzvID4lovqwFHXck=;
        b=EZ653UP7bia1BeWWScudJTrJmfz3IX5q7EdAbxy3/N0DfH0DSpUPHoFFFv1c8hSkhl
         2q2OclHCy2HO6zga+IgiuQZFGpzD8j6fWOcIPiOB1cpsWPv4+nIY2yOD6Z9/hXZz9nu2
         5ZGA/8hiftdCKqeaPFgGtZRD8u98vf/vMTjrf2ZXxGznrviDhZbwtBvDwrbeGBpeJyl+
         QSQwxUHrZLVarcx8chvkMZXNWUVw2pCr8JkJKyRSpdyMjnv1tvlknPMbAl61wYI3fU9c
         kkoRvf9LQp+7qrr3UJ1V3IgE686Mi6V+REt5ONsebZ5QjfN12lUACe3QC5WYD1ebZLCg
         AkWQ==
X-Gm-Message-State: AOJu0YxT4CFr7kYVZ3ziVr8PBbqRvjdeQf8iHsGHJxhP1+bc9kKBCctO
	V9C31tNfM8Oiz/5ldDuLiOOo1v5cPpAEbPb6O0is4fHeJcVATYhacZo+W+D3NXHJ9OZaE8NHdYB
	iuMKUBBoWf1RUKM2vMOC3C95CYiu0PX0s/PgLrwjJ
X-Gm-Gg: AZuq6aKSpegwtQyGJ0a+IYQssEIxxDkn+khuxAQsw553DLtUaDeFFjfPLYjnz064+88
	5e6Xa0hQjN4M68iMVHorhmBXUFXFSolo8qI0JsE34ZTLUFhg7LSJNMLmYLp3PKtL3vQrZqlvcgg
	KsqKSwajrljWDxBcXSswyAR5eSrdrLu5LfzyX5tqdlhaHeX2FRo4AzA78nFR3MhspZ9m9G3oJBT
	38CD6Nru8qAG849gQyOazp85vfMj2bXWo02x+qfsu0AQFHHKqw0V6h01HpBO5FNM/VGiQ==
X-Received: by 2002:a05:690c:9a03:b0:792:7828:b709 with SMTP id
 00721157ae682-7949dec1ed6mr104937547b3.22.1770058422795; Mon, 02 Feb 2026
 10:53:42 -0800 (PST)
MIME-Version: 1.0
References: <cfc1ab6b-fb2d-4f62-ba4d-acf95c568f68@app.fastmail.com>
In-Reply-To: <cfc1ab6b-fb2d-4f62-ba4d-acf95c568f68@app.fastmail.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 2 Feb 2026 13:53:30 -0500
X-Gm-Features: AZwV_QgZ6pxRpxrMFfRXDh6dK0zof3hovPiogbIifafgZiO3lmlfUCWk7PkSlTY
Message-ID: <CADL8D3bQMEEBVcgNQO7-TM_iygeBtwhy+EsVyHrJM_S405XGuA@mail.gmail.com>
Subject: Re: [meta-ti] Which MACHINE for AM62A starter kit?
To: ManWag@fastmail.fm
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Feb 2026 18:53:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19452

On Mon, Feb 2, 2026 at 1:12=E2=80=AFPM Manuel Wagesreither via
lists.yoctoproject.org <ManWag=3DFastMail.FM@lists.yoctoproject.org>
wrote:
>
> Dear all,
>
> I'd like to build an image for the SK-AM62A-LP "AM62A starter kit for low=
-power Sitara=E2=84=A2 processors". [1]
>
> I'm not sure which of those two MACHINEs to choose:
> * am62axx-evm [2], which seems to be specifically for the AM62 *A*
> * am62xx-lp-evm [3], probably being specifically for the *LP* (whatever t=
hat stands for)
https://software-dl.ti.com/processor-sdk-linux/esd/AM62AX/11_01_07_05/expor=
ts/docs/linux/Overview_Building_the_SDK.html#build-steps

MACHINE=3Dam62axx-evm bitbake -k tisdk-edgeai-image

>
> [1] https://www.ti.com/tool/SK-AM62A-LP
> [2] http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/meta-ti-bsp/co=
nf/machine/am62axx-evm.conf?h=3Dmaster
> [3] http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/meta-ti-bsp/co=
nf/machine/am62xx-lp-evm.conf?h=3Dmaster
The 62xx is a slightly different processor...
https://www.ti.com/tool/SK-AM62-LP
>
> Thanks for advice,
> Manuel
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19451): https://lists.yoctoproject.org/g/meta-ti/mess=
age/19451
> Mute This Topic: https://lists.yoctoproject.org/mt/117601305/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [jcormier@cri=
ticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

