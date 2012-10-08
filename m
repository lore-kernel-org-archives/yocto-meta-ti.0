Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 825B0E01275;
	Mon,  8 Oct 2012 03:54:47 -0700 (PDT)
Received: by mail-ie0-f176.google.com with SMTP id k11so10296691iea.35
	for <multiple recipients>; Mon, 08 Oct 2012 03:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=IictIYJNGI4RfWdT4/qTeTh8a4qS42shom9wEduE8rk=;
	b=HPUydgCkyI7O7uVPRCiOdW+6CczgMOHHAD/itXMClyb93L9fLhASR4KYnAjrhWuhdj
	xhLW4yELqECkkKyHNS+CA2YM+S6JeVAhmHkvE/Euy92fhDXNnLxVjSbGiGz/bnEA+Ead
	QlypEthXgRx+1qwVm8C8xUvtSslrH02KAcPTt8EJ5J/5UPDmGEG2IXc2oi3mtSDyjmw+
	0vwJXlDI/RF8Y4SR+NhRYkBsgzpktzjwAI/WNjqzDM7t8lMWh3bB3ml0zk93ExFLseno
	3NkrQx83pJj0/x1kCYX935hjaDbJTNm7cs8YLmZRI0IL3EkdMCCKw6XRBvhzHQr8lSQW
	6InA==
MIME-Version: 1.0
Received: by 10.42.18.193 with SMTP id y1mr12550393ica.0.1349693686909; Mon,
	08 Oct 2012 03:54:46 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Mon, 8 Oct 2012 03:54:46 -0700 (PDT)
Date: Mon, 8 Oct 2012 12:54:46 +0200
Message-ID: <CALbNGRRRk1HRJx4Ahk1E8AiB+MFxqa4m1y38GDhycPwgHBREag@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: gumstix-users@lists.sourceforge.net
Cc: meta-ti@yoctoproject.org, yocto@yoctoproject.org,
	angstrom-distro-devel@linuxtogo.org
Subject: meta-gumstix proceedings
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
X-List-Received-Date: Mon, 08 Oct 2012 10:54:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

as some of you might know, gumstix created an official BSP layer
[1][2]. To avoid confusion I renamed my layer from meta-gumstix to
meta-gumstix-community [3]. Users should either switch to the official
meta-gumstix layer or rename meta-gumstix to meta-gumstix-community
[3] in git configuration (users of angstrom-setup-scripts should also
change the name in layers.txt).

Andreas

[1] http://sourceforge.net/mailarchive/message.php?msg_id=29914700
[2] https://github.com/gumstix/meta-gumstix
[3] https://gitorious.org/schnitzeltony-oe-meta/meta-gumstix-community

