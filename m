Return-Path: <mb5p3nc3r2@googlemail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7DCC9E00283
	for <meta-ti@yoctoproject.org>; Tue, 31 Jul 2012 22:59:32 -0700 (PDT)
Received: by qcsc21 with SMTP id c21so4878821qcs.35
	for <meta-ti@yoctoproject.org>; Tue, 31 Jul 2012 22:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=VGbCj4gmBcJ6chIgVQ2SK8Y4gCNClWtXLrNDrcY7Gs8=;
	b=u287QS+bsfvAHLqkoroodeZfbXEGOBE7h2Fcr6dQqj6pwWVpkZFJk5Ntsa2+GemEhw
	Ujcwznqf5p8K8lGGAnAP2A5mZsVu+5dCdr+exl4VCWL8DEJsRU+a3Azw5DyZAgkVUCRx
	TD1Bdl2HiEprRE+jxQ27ZE5tA2vwXDFBLs1sgIPqZkLlty67wyjHU9wTRIBcZC0QK4Bh
	KQZev24xf1EX2uel+b+v4Nb1qtCGUuajcTUt0eyC8NZLHJcLTb2kVYA5gDu4JOBcw8w6
	7kFds7sh9+eDuyxlh0UVRqLp8UZ+CHkszbwIHF8sufg3hkYekWl3bmBIF93L9+PMi/mh
	SxZg==
MIME-Version: 1.0
Received: by 10.229.135.70 with SMTP id m6mr609477qct.104.1343800771446; Tue,
	31 Jul 2012 22:59:31 -0700 (PDT)
Sender: mb5p3nc3r2@googlemail.com
Received: by 10.229.184.2 with HTTP; Tue, 31 Jul 2012 22:59:31 -0700 (PDT)
Date: Wed, 1 Aug 2012 06:59:31 +0100
X-Google-Sender-Auth: YehvuWC1bUvuu0fbXlqNDnm7DO8
Message-ID: <CA+itjEGUuhwLOVADq5c5cntPyZQa1qqDZ2v4Y2YdpAC4bTHeaQ@mail.gmail.com>
From: Matthew Spencer <matthew@thespencers.me.uk>
To: meta-ti@yoctoproject.org
Subject: OMAP4 SGX drivers
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
X-List-Received-Date: Wed, 01 Aug 2012 05:59:32 -0000
Content-Type: multipart/alternative; boundary=00248c6a8802a18a4604c62dff52

--00248c6a8802a18a4604c62dff52
Content-Type: text/plain; charset=ISO-8859-1

Hi Guys

I am looking into using the meta-ti project to help me build a demo
platform around the Pandaboard.  I need to get the SGX drivers working for
the demo - but I notice that the virtual/egl package is only available for
OMAP3 based platforms and excludes the pandaboard from its configuration.

Am I supposed to be able to build the SGX packages through the meta-ti
project - and if so how?

If the package is not available through the meta-ti project, what is my
best approach for including is?

Kind regards

Matt

--00248c6a8802a18a4604c62dff52
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Guys<div><br></div><div>I am looking into using the meta-ti project to h=
elp me build a demo platform around the Pandaboard. =A0I need to get the SG=
X drivers working for the demo - but I notice that the virtual/egl package =
is only available for OMAP3 based platforms and excludes the pandaboard fro=
m its configuration.</div>
<div><br></div><div>Am I supposed to be able to build the SGX packages thro=
ugh the meta-ti project - and if so how?</div><div><br></div><div>If the pa=
ckage is not available through the meta-ti project, what is my best approac=
h for including is?</div>
<div><br></div><div>Kind regards</div><div><br></div><div>Matt</div>

--00248c6a8802a18a4604c62dff52--
