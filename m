Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD572E0049B
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2012 01:40:35 -0700 (PDT)
Received: by wgx1 with SMTP id 1so4731076wgx.11
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2012 01:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=V5sgQNhsW6iSGLD9V9w03e6jGvKD2zMMw38po5Wfpp0=;
	b=G2WrQcTs9qn8L6kSO4JVpJLmFxp1vQdz6Y75fe+gx5zRWuADk87HVIkKPIvvPFq0nf
	RpP4todutRn5C/Qr0CgA76Ojfax7agKlyOs5/l7Cu2nB1yutTL8z6e+jXjA5y7BCpIkE
	QeIYxhtZD6q/nOZ3NEDAZopNQdxH9QrhdNiVdwMt1PaQQIqxu19QjRcU7Zd48fh4x0+z
	MWc+7saPh96yQ6A6gJxyX5E8p7goej61McrlaRuHF8+07WgQUoiOl2WZuvLInsBCFXAF
	TDOugId9yXKpr6KiuyEbekPCyqCmVAWIpkaCAfuFONs/duCO1VO8L6d0PSWXpeQxKaSd
	SVPg==
Received: by 10.180.81.133 with SMTP id a5mr36063625wiy.17.1345538434050;
	Tue, 21 Aug 2012 01:40:34 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id ck9sm2614519wib.2.2012.08.21.01.40.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Aug 2012 01:40:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1345535127.49985.YahooMailNeo@web121206.mail.ne1.yahoo.com>
Date: Tue, 21 Aug 2012 10:40:32 +0200
Message-Id: <596637BD-7837-40A9-B043-C26D49C5B55F@dominion.thruhere.net>
References: <1345535127.49985.YahooMailNeo@web121206.mail.ne1.yahoo.com>
To: jakes2@ovi.com
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQnGDLOxo0uRsuovMQmmuYalEditPC0+xU0nz2DV1mbC8VP/JidbyQN6TNeey0QaapsdGjwd
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Linaro and CS ABI compatibility
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
X-List-Received-Date: Tue, 21 Aug 2012 08:40:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Op 21 aug. 2012, om 09:45 heeft jakes2@ovi.com het volgende geschreven:

> Hello all,
>=20
> As we all know, the Graphics SDK from TI is done with CodeSourcery's =
toolchain

I wouldn't be so sure about that


> and Yoctoproject prefers to use Linaro.

Same for the above.=

