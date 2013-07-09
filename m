Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C75BDE005B3
	for <meta-ti@yoctoproject.org>; Tue,  9 Jul 2013 08:21:14 -0700 (PDT)
Received: by mail-ob0-f181.google.com with SMTP id 16so7001884obc.26
	for <meta-ti@yoctoproject.org>; Tue, 09 Jul 2013 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=PMK0inz87JlMQ5GOKKeoQUtycEqxQJty4RbpGcuH54s=;
	b=igwA3aDjsKJPvYlIfTXqoL7kdq1zIuA+dhPYpwRVksW7fNyyHAp88h9Dx4hgwyo4rT
	8uXhDxW8VlENqn4bYJl6LHdFnqZmXZM5upqdrH2Zmglr6oocP5eXRn8hhiSgzl7qcqYz
	SkTNHY5sBy6bVvPnYOobFfipSFMDSg25bpEQ30b6yZHOcYJ//0p7s3peymigryb31H5B
	t3k3R1zmbl8oxFranf8FiZRvLcszMWDOtgNm96se+IdqM+l4wlLvnD1dPoBMGhAH7fZH
	XUGmDOCj4FZk+UX6+XXyf5OdrFpIAaAnLAqkVDp2dCBzrXqHdhvesi2x+WfluQ3PDjV4
	/Lxg==
MIME-Version: 1.0
X-Received: by 10.60.142.103 with SMTP id rv7mr24596348oeb.13.1373383273704;
	Tue, 09 Jul 2013 08:21:13 -0700 (PDT)
Received: by 10.60.26.225 with HTTP; Tue, 9 Jul 2013 08:21:13 -0700 (PDT)
Date: Tue, 9 Jul 2013 11:21:13 -0400
Message-ID: <CAFZh4h8osM3+bExMHS8zP-YU56h=hsSqjRfAC7Vo9Qu1_kze-w@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Which machine type to use for DaVinci DM6446 and TI816x?
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
X-List-Received-Date: Tue, 09 Jul 2013 15:21:15 -0000
Content-Type: multipart/alternative; boundary=047d7b2e08872b75ff04e115b6ca

--047d7b2e08872b75ff04e115b6ca
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I have to support DaVinci DM6446, AM1808, OMAP-L138 and C6A816x which has
turned into TI816x in later silicon releases.

I'm trying to figure out what conf/machine to use for the above SoC's.

In Denzil, I see am389x-evm.conf and c6a816x-evm.conf and both include the
same ti816x.inc file, but I do not see support for this machine in Danny or
Dylan (unless I'm missing something).  How should I go about using Dylan
with the ti816x?

For DaVinci DM6446, I don't see an obvious machine type that supports it
but I know that the DM6446, AM1808 and OMAP-L138 are all in the same ARM926
family (da850) so should I be using the am1808-evm.conf for DaVinci DM6446?

I've always used Arago or Angstrom for DM6446 support in the past and so
I'm not sure which .conf I should be using with meta-ti.  My gut says use
am1808-evm.conf but I thought I should ask to be sure.

Regards,

Brian

--047d7b2e08872b75ff04e115b6ca
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>I have to support DaVinci DM6446, AM1808, OMAP-L138 =
and C6A816x which has turned into TI816x in later silicon releases.</div><d=
iv><br></div><div>I&#39;m trying to figure out what conf/machine to use for=
 the above SoC&#39;s.</div>
<div><br></div><div>In Denzil, I see am389x-evm.conf and c6a816x-evm.conf a=
nd both include the same ti816x.inc file, but I do not see support for this=
 machine in Danny or Dylan (unless I&#39;m missing something). =A0How shoul=
d I go about using Dylan with the ti816x?</div>
<div><br></div><div>For DaVinci DM6446, I don&#39;t see an obvious machine =
type that supports it but I know that the DM6446, AM1808 and OMAP-L138 are =
all in the same ARM926 family (da850) so should I be using the am1808-evm.c=
onf for DaVinci DM6446?</div>
<div><br></div><div>I&#39;ve always used Arago or Angstrom for DM6446 suppo=
rt in the past and so I&#39;m not sure which .conf I should be using with m=
eta-ti. =A0My gut says use am1808-evm.conf but I thought I should ask to be=
 sure.</div>
<div><br></div><div>Regards,</div><div><br></div><div>Brian</div><div><br><=
/div>

--047d7b2e08872b75ff04e115b6ca--
