Return-Path: <deepakvijay2255@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96A5BE004EB; Wed, 30 Apr 2014 05:00:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.215.67 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f67.google.com (mail-la0-f67.google.com
	[209.85.215.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76EC2E003C7
	for <meta-ti@yoctoproject.org>; Wed, 30 Apr 2014 05:00:37 -0700 (PDT)
Received: by mail-la0-f67.google.com with SMTP id mc6so318796lab.2
	for <meta-ti@yoctoproject.org>; Wed, 30 Apr 2014 05:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=LoqiqtQi9rZqdjKSKoHb34NLVwTPPKXqsWm41Qj7aXc=;
	b=z4BMJ2LlB6BF59GaUu8H31C3xnKuQxMDmj5ece6gPP6Yk/HuSMPyD2/79u+D3ZvzEm
	K/2lzag9sPeLvkTaq+HCFnTzbQ9mVptVRfJDpXOP0h6kfXvwiVxOUq+4ox3sueC2z6OC
	gZH4ywQGV6xag2jSHonZlQFM0hbQliO7txJLh6r9UlEIvmR6huVkr7EUU7UwPoolXB5i
	8RIKJnThmZstfZ/ARebcsd0odRJKD+yUTnrR0Ev4Lj/JdFQnNzzmbfwTyFrwn97Z4Vic
	01cB93BlI4hBj79I1oEkGh8SARBhO1GHoFNs0nPBX/mYudjTHNvQG4QpMx06WyP3a6Og
	oK4Q==
MIME-Version: 1.0
X-Received: by 10.112.27.133 with SMTP id t5mr2623342lbg.21.1398859235324;
	Wed, 30 Apr 2014 05:00:35 -0700 (PDT)
Sender: deepakvijay2255@gmail.com
Received: by 10.112.47.70 with HTTP; Wed, 30 Apr 2014 05:00:35 -0700 (PDT)
Date: Wed, 30 Apr 2014 17:30:35 +0530
X-Google-Sender-Auth: W71Jms2TXFdeKqAfWT7vnxKRMF8
Message-ID: <CAAxuRXjSVQ+yu5znei1LwA1hRhLbKADo5jtR0i+m+6xh2g0SgA@mail.gmail.com>
From: deepak vijay <deepakvijay2255@rediff.com>
To: meta-ti@yoctoproject.org
Subject: Regarding linux configuraion
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
X-List-Received-Date: Wed, 30 Apr 2014 12:00:42 -0000
Content-Type: multipart/alternative; boundary=001a1133b04acff73504f8414b13

--001a1133b04acff73504f8414b13
Content-Type: text/plain; charset=UTF-8

Hi,
I am new to yocto project.
I have seen the U-boot configuration variable (UBOOT_MACHINE) in
conf/machine/include/.. files.
I would like to know where the linux kernel configuration variable will be
used?
Please help me to understand this.


Regards,
Deepak

--001a1133b04acff73504f8414b13
Content-Type: text/html; charset=UTF-8

<div dir="ltr">Hi,<div>I am new to yocto project.</div><div>I have seen the U-boot configuration variable (UBOOT_MACHINE) in conf/machine/include/.. files.</div><div>I would like to know where the linux kernel configuration variable will be used?</div>
<div>Please help me to understand this.</div><div><br></div><div><br></div><div>Regards,</div><div>Deepak</div></div>

--001a1133b04acff73504f8414b13--
