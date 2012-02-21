Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96A7FE00749
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:33:11 -0800 (PST)
Received: by wibhi8 with SMTP id hi8so4137438wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:33:10 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.7.231 as permitted sender)
	client-ip=10.180.7.231; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.7.231 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.7.231])
	by 10.180.7.231 with SMTP id m7mr32275558wia.3.1329820390789 (num_hops
	= 1); Tue, 21 Feb 2012 02:33:10 -0800 (PST)
Received: by 10.180.7.231 with SMTP id m7mr26975378wia.3.1329820390515;
	Tue, 21 Feb 2012 02:33:10 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id df3sm8727052wib.1.2012.02.21.02.33.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 02:33:09 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 21 Feb 2012 11:33:14 +0100
Message-Id: <1E334B80-9A0B-402E-9FD0-20C6DEB21808@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Mime-Version: 1.0 (Apple Message framework v1257)
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkNpA4gnY1lIBauCzbzXZrqMLUc3JYJDS599tPODZ4nR6xExElQw7uisDJLsaIRLPzODnoY
Subject: [Beagleboard.org][PATCH v2 0/10]
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
X-List-Received-Date: Tue, 21 Feb 2012 10:33:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Denys,

The following set of 10 patches is a combination of what went into the =
latest beaglebone factory image and an update to the beagleboard kernel. =
It can be pulled from github:

=
https://github.com/angstrom-distribution/meta-ti/tree/beaglebone-release-2=
01202

regards,

Koen=

