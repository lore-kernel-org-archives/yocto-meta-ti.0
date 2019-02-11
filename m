Return-Path: <madhu1313b@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62068E00C1B; Mon, 11 Feb 2019 04:34:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (madhu1313b[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.180 listed in list.dnswl.org]
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 401C0E0090C
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2019 04:34:54 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id e5so11807208qtr.12
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2019 04:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=axSi0RMLc3GXdzrBdTr5xtT/DIPLVEj2/aXwrfNyCWg=;
	b=aCQHkXq8N+c3KR4yduClq4JQrJSueURhzeRkSjtxEVLvYhxZx7pZGg3LOkxfrG0aqi
	rWH2rD2oZUBVrYOH6G/OYsyoCasW8LXF/nZhms7yrGDVIuzPWYHhhqGxqfYP/LR2eWN1
	+ZwaHDEmbS/BGpVd6cvpP10GAlGVC+VH/MJzr5U99k/T5ubb5zK4rHulIcPt7NkhG/0b
	lkGm7+7ixnlI7KaoKTwlaYgYQg8fq7S61A9RiBdKSfYd9X1yBqw1MOG3/IfuxVL2exX9
	tn6qqsHIsg2zV0nyRRfgH5de2SY/BH3aAz3kExli7LEJjJRmG0y0FL6A/SQ+ltJ9hQjr
	sL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=axSi0RMLc3GXdzrBdTr5xtT/DIPLVEj2/aXwrfNyCWg=;
	b=oGnnzwbRuUXuNEVjQZQxXPaHeK/zhdve7pTPjIOkDN/AyYDc+QvI/IJpmEpWiuwvn2
	7nf74qPE57pjZ9TFv5Fhee9T62GpmebIc+yxMTIC+j+Us3d5YuKN6uWJhwzcreU3hZzw
	xEkUUHhM30H5taHIaegCpswkDHVPycPilAPXxDT/Sk8e6wgdJyDRufZb9rhGRtzUJeNc
	gXFBn/P83JSplEbUYGIqHbiiOgAIKg3nWe2jDAW0MlQT/P86JVdzLtP7THtJLc+jYAvW
	C2S5yzt+eqHj2l+sVSJBX2bQJFx+/nA8fRvV2oUvJ5jH2z1Z69d+MGRujlkcwCZKXMc0
	CtUg==
X-Gm-Message-State: AHQUAuaJYjOgqkNjnDVRMTZvjVs1gn85/olFv++XtcA2nhhdFvzCxHH1
	wzSpx/9khRVc806dWLbHC6AefRoxc8ADq+AptX38QUDR
X-Google-Smtp-Source: AHgI3IYYC2PbJW0mlkVIaNeIeDqSMpUyQdkfaIxLdwa9olkab4xFh2L7JCB0Chpwm1A88aK7cmQUi1qCqvIPgbfGdVg=
X-Received: by 2002:ac8:d86:: with SMTP id s6mr26221274qti.324.1549888493555; 
	Mon, 11 Feb 2019 04:34:53 -0800 (PST)
MIME-Version: 1.0
From: Madhu B <madhu1313b@gmail.com>
Date: Mon, 11 Feb 2019 18:04:40 +0530
Message-ID: <CAH5YvUuMV-_6iGOxk79RH6=G3tt=poqcgNJhSrYHMXR75MmR9w@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: How can I enable the Wayland on panda board?
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
X-List-Received-Date: Mon, 11 Feb 2019 12:34:55 -0000
Content-Type: multipart/alternative; boundary="0000000000001993ae05819d89ff"

--0000000000001993ae05819d89ff
Content-Type: text/plain; charset="UTF-8"

Hello everyone,
                   I was trying to bring-up the AGL on panda board. I need
to know, how to enable the Wayland on panda board.

Regards,
-Madhu.

--0000000000001993ae05819d89ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello everyone,</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 I was trying to bring-up the AGL on panda board. I need to know, how=
 to enable the Wayland on panda board.</div><div><br></div><div>Regards,</d=
iv><div>-Madhu.</div></div>

--0000000000001993ae05819d89ff--
