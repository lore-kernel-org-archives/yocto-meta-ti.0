Return-Path: <cliff.brake@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30DE4E00905; Tue, 11 Nov 2014 05:55:28 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC048E008B4
	for <meta-ti@yoctoproject.org>; Tue, 11 Nov 2014 05:55:20 -0800 (PST)
Received: by mail-qg0-f54.google.com with SMTP id q108so7046466qgd.41
	for <meta-ti@yoctoproject.org>; Tue, 11 Nov 2014 05:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=SIDmN2+4Vi7g3xIsgmhszKv2tqbSRPajWlT2cS/nXpo=;
	b=0I1PYIgwDZcHVSANbSEXa5q6lE9KJtCdZ1tsEePC4WCmbsitNl+IqiFCR4DRTN6KSX
	Rv9Zj1pooAP0jI375GrggAwyO3Gx0wSMOp4jeJH+UxBXExoyz2UV8SeB7Uv/mwPw9Bl6
	bXaw9y1LswO/ZC8JiLhvTwl0U6/Id8soSDPoa2Vlfd82B8i/84mG6bBtin6JWb19XObK
	ZGB3FUo63zbFYwk7eYQ/YGsVXYLuOkuPlE4lTKRNi7Z5EaLvDYMgwKjJpnJhHHS3Cztl
	0SWt5OGlnA/Y/HFsmhttNZxd3zYYG+iMxyXosJxim0MwCqtvYScir38ts3OI/QJjn4ij
	aV3w==
MIME-Version: 1.0
X-Received: by 10.140.40.104 with SMTP id w95mr28918024qgw.14.1415714118400;
	Tue, 11 Nov 2014 05:55:18 -0800 (PST)
Sender: cliff.brake@gmail.com
Received: by 10.140.21.51 with HTTP; Tue, 11 Nov 2014 05:55:18 -0800 (PST)
Date: Tue, 11 Nov 2014 08:55:18 -0500
X-Google-Sender-Auth: mRpjIZF_K1WSISuMpPjD29OF8Ds
Message-ID: <CAOd_LFxoiKK-NjefTQwYcpTSu-JT3sTqm30jC2eYtaJ_n8=Dwg@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: QT5 on Overo
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
X-List-Received-Date: Tue, 11 Nov 2014 13:55:28 -0000
Content-Type: text/plain; charset=UTF-8

What is the path to getting QT5 working on an Overo (DM3730, etc).
What kernel version/recipe is supported, etc.

Thanks,
Cliff

