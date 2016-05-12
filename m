Return-Path: <Geoffrey.Parker@Arthrex.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C6E8E007E1; Thu, 12 May 2016 09:18:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [205.167.78.25 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 1092 seconds by postgrey-1.32 at yocto-www;
	Thu, 12 May 2016 09:18:40 PDT
Received: from barracuda.arthrex.com (barracuda.arthrex.com [205.167.78.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C89F3E006D8
	for <meta-ti@yoctoproject.org>; Thu, 12 May 2016 09:18:40 -0700 (PDT)
X-ASG-Debug-ID: 1463068826-06ac273b0f313a0001-g4O11g
Received: from INC-S-HUB002.arthrex.local ([10.3.5.25]) by
	barracuda.arthrex.com with ESMTP id tXp9CbZNM6mHxedh
	(version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 May 2016 12:00:26 -0400 (EDT)
X-Barracuda-Envelope-From: Geoffrey.Parker@Arthrex.com
Received: from INC-S-EXC002.arthrex.local ([fe80::516f:372:ad96:26bd]) by
	INC-S-HUB002.arthrex.local ([::1]) with mapi id 14.03.0181.006;
	Thu, 12 May 2016 12:00:26 -0400
From: Geoffrey Parker <Geoffrey.Parker@Arthrex.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [fido][PATCH] omap5-sgx-ddk-um-linux: Add DEPENDS
	based	on REDEPENDS
X-ASG-Orig-Subj: [meta-ti] [fido][PATCH] omap5-sgx-ddk-um-linux: Add DEPENDS
	based on REDEPENDS
Thread-Index: AdGsZe7oiGPX+4MSSY2PpKJkOk98Aw==
Date: Thu, 12 May 2016 16:00:25 +0000
Message-ID: <6C8F632E9A28D54CB9F9FD3A5BCBF90648548926@INC-S-EXC002.arthrex.local>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.5.18]
x-exclaimer-md-config: dc7fad0c-fbd7-469c-bbef-97f0fd95268b
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.3.5.25]
X-Barracuda-Start-Time: 1463068826
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA
X-Barracuda-URL: https://10.3.5.33:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 1117
X-Virus-Scanned: by bsmtpd at arthrex.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.32
X-Barracuda-Spam-Status: No, SCORE=0.32 using global scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=5.0
	tests=BSF_SC0_MISMATCH_TO, URI_HEX
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.29518
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	0.00 BSF_SC0_MISMATCH_TO    Envelope rcpt doesn't match header
	0.32 URI_HEX URI: URI hostname has long hexadecimal sequence
Subject: [fido][PATCH] omap5-sgx-ddk-um-linux: Add DEPENDS based	on REDEPENDS
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
X-List-Received-Date: Thu, 12 May 2016 16:18:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Jacob, Denys,

I'm having a build issue once I pulled in the the 85810547 commit on the me=
ta-ti fido branch:

ERROR: Nothing PROVIDES 'libgbm' (but /home/geoff/yocto/poky/meta-ti/recipe=
s-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb DEPENDS on or oth=
erwise requires it). Close matches:
  libgxim
  libsm
  libqb
NOTE: Runtime target 'omap5-sgx-ddk-um-linux-dev' is unbuildable, removing.=
..
Missing or unbuildable dependency chain was: ['omap5-sgx-ddk-um-linux-dev',=
 'libgbm']
NOTE: Runtime target 'omap5-sgx-ddk-um-linux-plugins' is unbuildable, remov=
ing...
Missing or unbuildable dependency chain was: ['omap5-sgx-ddk-um-linux-plugi=
ns', 'libgbm']
NOTE: Runtime target 'omap5-sgx-ddk-um-linux' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['omap5-sgx-ddk-um-linux', 'li=
bgbm']

Looking at the meta-layer index I can only find libgbm in the meta-ti maste=
r & krogoth branches.=20
Our external layers are currently using the Yocto jethro branches except fo=
r meta-ti (which has=20
not jethro, so we use fido). We are not quite ready to move to krogoth yet.

Best Regards,
Geoff Parker

This e-mail and any files transmitted with it are the property of Arthrex, =
Inc. and/or its affiliates, are confidential, and are intended solely for t=
he use of the individual or entity to whom this e-mail is addressed. If you=
 are not one of the named recipient(s) or otherwise have reason to believe =
that you have received this message in error, please notify the sender at 2=
39-643-5553 and delete this message immediately from your computer. Any oth=
er use, retention, dissemination forwarding, printing or copying of this e-=
mail is strictly prohibited. Please note that any views or opinions present=
ed in this email are solely those of the author and do not necessarily repr=
esent those of the company. Finally, while Arthrex uses virus protection, t=
he recipient should check this email and any attachments for the presence o=
f viruses. The company accepts no liability for any damage caused by any vi=
rus transmitted by this email.

