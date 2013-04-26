Return-Path: <liljegren.mats2@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38847E014D3
	for <meta-ti@yoctoproject.org>; Fri, 26 Apr 2013 00:06:27 -0700 (PDT)
Received: by mail-ee0-f44.google.com with SMTP id t10so1614646eei.3
	for <meta-ti@yoctoproject.org>; Fri, 26 Apr 2013 00:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=NPRdaK4GFOaEfr0paCdNNW4DeK+fqA/vn8cuet6hDCY=;
	b=TZdsxHe85kJDJqbhnmPqfimfQ3YBLEdCbT1eUek/JE9mYNlSpIF3F/sbt9p1O4L94p
	qWIeO0xVNNHbrw6R9DY/0WUsgzjfLpwWPZ+OMeCBMYXh3HwFLHPVVhPGHNtclMKKrAZN
	hegsiRFNDnKD95l4dKqDPQFhKrcmStkiy1JxcpPR3SbRuVuQgOWe5q5Z+MzhD9dSNYEX
	oI8MD+LEe4b1zFojE/UNIdRoMRn5zv/yQMGGjJQHSZ4Zt4ABxxNd+9WZfQEk9bCbS1xQ
	87Y9qWRBbLCCEb3njiQuDdwJUsPuTViJ7BZ6CTXz5DKlmtuq/WL0l9JjQbNS7W3+p+YY
	lIJA==
MIME-Version: 1.0
X-Received: by 10.15.43.73 with SMTP id w49mr84795054eev.12.1366959985983;
	Fri, 26 Apr 2013 00:06:25 -0700 (PDT)
Received: by 10.15.83.67 with HTTP; Fri, 26 Apr 2013 00:06:25 -0700 (PDT)
Date: Fri, 26 Apr 2013 09:06:25 +0200
Message-ID: <CA+xJJ18wBM7G=Nt12yMX8KLmTZWS+SnBsXb3F4X1xgq=Y=0y0w@mail.gmail.com>
From: Mats Liljegren <liljegren.mats2@gmail.com>
To: linux-omap <linux-omap@vger.kernel.org>, meta-ti <meta-ti@yoctoproject.org>
Subject: Full nohz on TCI6638k2k (KeyStone II)
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
X-List-Received-Date: Fri, 26 Apr 2013 07:06:27 -0000
Content-Type: text/plain; charset=UTF-8

I would like to perform a customer demo running a benchmark
application in full nohz mode on TCI6638k2k target, which as far as I
understand it is a KeyStone II architecture.

Does anyone know what the best Linux source code is to perform the
nohz port for this board? It should preferably be Linux 3.9 of any RC
level, but 3.8 should work as well.

I also need a hardware timer to be used as an interrupt source for the
interrupt latency measurements. Any suggestions for framework or
driver to use?

/Mats

