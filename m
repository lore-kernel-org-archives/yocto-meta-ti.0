Return-Path: <deepakvijay2255@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08F8BE00655; Mon, 27 Feb 2017 21:19:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C53EE0052B
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 21:19:40 -0800 (PST)
Received: by mail-wm0-f47.google.com with SMTP id v77so76187523wmv.1
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 21:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:from:date:message-id:subject:to;
	bh=kPBU60r+UZNUByb/Dohz9kCQRdI1xTlG+VILA9HRutU=;
	b=Atd6ivZgmYvzorRhY69tx1Xmi5Ql7lOHgOjCIdmHej89J3dvnlX7ST/QD+kBUcBBAk
	ARwqGP8g9DDRFvLkhJoRTiw2WWFyWAVC6DE4lwqsSEYhHttSO94UmvwBzS62xdSwNiMV
	lM1qyn8e7qvDk593kcPQxs+L9k6wLjOxWR4HIdffrGWJN4w2ejQoQWJvM8u4Ucx0gvvK
	4Di6pI8RI2XcyED/j5YhQw6Wzqoz8SXgMnblEF8nqBESGEBi+49TY8sfnshCQn1Snm/3
	TI2I+yzKuiEo9u09P0ftl56Xv0xT7zQ2hBEh+0g2qJNJs/0bOYSyzScHerDMd3bChMOQ
	pEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
	:to; bh=kPBU60r+UZNUByb/Dohz9kCQRdI1xTlG+VILA9HRutU=;
	b=P6ICw4hvjJMbQkpjAGoUcQX8Y9vHy67dCBG8oY3INgU+57jGfb6LILXFUtFZO9+07j
	3nim0uqDR4kNDSfaO5MHwdwXl1TwyrmyR6nxyqVXKzV1W5/6x5M91fljQElUoIROlJ3a
	BYw26//KT9s8YVOvTLg3xYG7SKa/ziKSBUAplXOQE+yoxhl5lSSM0GGuk3+7qcDwNzB7
	V9tIw1sD3DYcR/lR+5xNOO5DiDqOU4pZi/6QUHaNswgFbLV9DCy7GeXy9XFMGh84UQUN
	FS6Pc8EhzhD5cyHiIM7kYYLXnmA7quCuSY5W6PRGt2Cyo2BkH7/xa8MiIxIJ0MG5CRR7
	x3uQ==
X-Gm-Message-State: AMke39nWUTp21ShIyAmhfzcFICdufcJKCCLvnvtbgXZXRf6HhOLaEsGMAHMpqMyyCwLYvW0euVSDwkC/qrZLXQ==
X-Received: by 10.28.111.136 with SMTP id c8mr625427wmi.128.1488259179351;
	Mon, 27 Feb 2017 21:19:39 -0800 (PST)
MIME-Version: 1.0
Sender: deepakvijay2255@gmail.com
Received: by 10.28.158.205 with HTTP; Mon, 27 Feb 2017 21:19:39 -0800 (PST)
From: deepak vijay <deepakvijay2255@rediff.com>
Date: Tue, 28 Feb 2017 10:49:39 +0530
X-Google-Sender-Auth: sRPmAAow81JPLyXw51t1yN-xMM4
Message-ID: <CAAxuRXgyUpGH+c+QPU5h1_2PdBYZqa44LQccqkALBMScPOdERQ@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Unsubscribe mail chain
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
X-List-Received-Date: Tue, 28 Feb 2017 05:19:43 -0000
Content-Type: multipart/alternative; boundary=001a1147c3e0b818b2054990576c

--001a1147c3e0b818b2054990576c
Content-Type: text/plain; charset=UTF-8

Hi,

Please unsubscribe the meta-ti mail chain and from the group itself

-- 
Regards,
Deepak Vijay

--001a1147c3e0b818b2054990576c
Content-Type: text/html; charset=UTF-8

<div dir="ltr">Hi,<br><br>Please unsubscribe the meta-ti mail chain and from the group itself<br clear="all"><div><br>-- <br><div class="gmail_signature" data-smartmail="gmail_signature"><div dir="ltr">Regards,<div>Deepak Vijay</div></div></div>
</div></div>

--001a1147c3e0b818b2054990576c--
