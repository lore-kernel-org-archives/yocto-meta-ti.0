Return-Path: <paul.marc.liu@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF2ACE00B5C; Thu,  1 Jun 2017 11:49:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (paul.marc.liu[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.169 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.169 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45D4CE00BAF
	for <meta-ti@yoctoproject.org>; Thu,  1 Jun 2017 11:49:22 -0700 (PDT)
Received: by mail-qk0-f169.google.com with SMTP id 19so43816739qke.2
	for <meta-ti@yoctoproject.org>; Thu, 01 Jun 2017 11:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=PNiGDWpvdHtC1E1w9RvmpJwr6oD1DcNb4TnE9kA/DJA=;
	b=dX5LObEEZZur0P2dK4QvBkM0t4mEX4LXiOSpJz9RmQRp+PR/yjTSaIGH7pOLQl4Cz9
	BGAp8n9lc8XAR1iFiYPQ86vWJs0uHs4nOeZmZ0x6gBFREn+SFMYLQmLaXih9RBg57HLz
	L4MxYE48qu5lfSwkPVEUkJoYJEqxm2UOI3ERdqtS038xwMbNNbstr4n+DGQrzd6WaIRw
	SdAJMJfiVZ8ixz8Hg+fPYhyBZGBqn50VtE0gSTW9ll42kQIfbp2Hdgi5ZV5LEp4xLNvz
	qDJSc9biZF3pkLvZX90cCWhAWgqlv+F2oWhk6SWtQahbq5OZZyPwNfFoG2SSD9tR+o/v
	KQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=PNiGDWpvdHtC1E1w9RvmpJwr6oD1DcNb4TnE9kA/DJA=;
	b=ckENqpHYuRcb6rySO43fWXqxXg2ekLlFa4AIWJbuJC0kYbNqAadgU8Z6NHd9kW7q0p
	Fpi6ZEBdSaA1fCRuR1trYjsqf4RiNaxlpGHn5vFpdS6Cgea9raIomZ7PUqdkEJsIxWyR
	sIjW27iu7/bieiwTgE3DRZ4tA/Vm9SuviF3vSbrPK097zAKziJ/wsLQDD6llCqOGWe51
	CTorsIPOglIMr2LVygxAPVw62P3uGxSOUzIjU1gXaB9rpeaGRikyFC2oroeLLkCuDNot
	+6sP6MGIcvLcwYyIdXiRnCn/rteQ5pQJqBVr1DjbhSrQ6M743DmV3HD42zTdURvpDFX6
	CfoA==
X-Gm-Message-State: AKS2vOzN42qM5cX9yBrUbd6icbnuun5eqb8v8HWPVUZBUvpxB2VNwrR0
	sgNFLfBn5AeFUwoJQwxrQl4lU3+845Q2cmc=
X-Received: by 10.55.18.14 with SMTP id c14mr3823067qkh.138.1496342962080;
	Thu, 01 Jun 2017 11:49:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.18 with HTTP; Thu, 1 Jun 2017 11:49:21 -0700 (PDT)
From: Paul Marc Liu <paul.marc.liu@gmail.com>
Date: Thu, 1 Jun 2017 11:49:21 -0700
Message-ID: <CAC_8XzCiyAFTzZbOzA2MBPLZH7af+pcqisqeZkEHeTRBOUwCOA@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Beaglebone Black capemgr support on pyro
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
X-List-Received-Date: Thu, 01 Jun 2017 18:49:27 -0000
Content-Type: multipart/alternative; boundary="001a11471190b791db0550ea7ebc"

--001a11471190b791db0550ea7ebc
Content-Type: text/plain; charset="UTF-8"

I am currently attempting to add beaglebone capemgr support to yocto pyro.
The last mention of this effort that I was able to find in the yocto
project was:

https://lists.yoctoproject.org/pipermail/yocto/2014-October/021821.html

I don't see meta-ti in the yocto pyro branch.  I would appreciate any
direction on how to enable capemgr.

Thank you.

Paul Liu
-- 

- Message content Private and Confidential -
- If message was forwarded by mistake, please destroy
message and attachments immediately. -

--001a11471190b791db0550ea7ebc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am currently attempting to add beaglebone capemgr suppor=
t to yocto pyro.=C2=A0 The last mention of this effort that I was able to f=
ind in the yocto project was:<div><br></div><div><div><a href=3D"https://li=
sts.yoctoproject.org/pipermail/yocto/2014-October/021821.html">https://list=
s.yoctoproject.org/pipermail/yocto/2014-October/021821.html</a><br></div><d=
iv><br></div><div>I don&#39;t see meta-ti in the yocto pyro branch.=C2=A0 I=
 would appreciate any direction on how to enable capemgr.</div><div><br></d=
iv><div>Thank you.</div><div><br></div><div>Paul Liu</div>-- <br><div class=
=3D"gmail_signature">=C2=A0<br>- Message content Private and Confidential -=
<br>- If message was forwarded by mistake, please destroy<br>message and at=
tachments immediately. - </div>
</div></div>

--001a11471190b791db0550ea7ebc--
