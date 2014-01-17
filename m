Return-Path: <samuli.piippo@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 022EFE00867
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 05:57:49 -0800 (PST)
Received: by mail-ea0-f182.google.com with SMTP id r15so938515ead.27
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 05:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=DsE60lcEgpxXSRTZaP2l2xIN3bHlr4QjzKPyts295uk=;
	b=I5uQyEaBwb+qQ+aBUxG42l9GDjvOAw8bCC6o9jLR2lQTMsWmROrNqwQ+VzhjMB1jhZ
	keOHbNr0AMn4PmYNoj/FwWal5qCbPrQflSJNGZeSgHEKUHlpYm7R43wCr2H1M0sc2rx3
	67VwmakrrQA6ceNRKP3T6mA5Rxtp7uxGAxKUvPVU0dp2T0YFNSbSvJs1CHilpuSHrieP
	oh2X8n7h+a/poyafwLiWtdL+Hw8eVta3DHl8AUhrbIk/aTrNdvvKaMV73r8jY1iNPUZr
	4DSYOJ4+qANDw560AAgt1NpZdlk/Quc3EuiMrPh3mVuTNIAk714q7SqDzhfo2yUNsKG6
	J5KA==
X-Received: by 10.15.36.65 with SMTP id h41mr2764996eev.0.1389967068390;
	Fri, 17 Jan 2014 05:57:48 -0800 (PST)
Received: from [10.9.5.71] ([91.217.248.11])
	by mx.google.com with ESMTPSA id k41sm3140128eey.0.2014.01.17.05.57.47
	for <meta-ti@yoctoproject.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 17 Jan 2014 05:57:47 -0800 (PST)
Message-ID: <52D936DC.2090806@gmail.com>
Date: Fri, 17 Jan 2014 15:57:48 +0200
From: Samuli Piippo <samuli.piippo@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: usb problems with BeagleBone Black
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
X-List-Received-Date: Fri, 17 Jan 2014 13:57:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I've been trying to get BeagleBone Black to work with poky image, but
there seems to be some issues with USB.
No usb devices are detected by kernel and e.g., 'lsusb' return error
'unable to initialize libusb: -99'

Anyone know if USB is supposed to work on BBB with current meta-ti layer?

I'm using yocto from dora branch and meta-ti from master.

-samuli

