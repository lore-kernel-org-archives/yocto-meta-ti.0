Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9926EE016B3
	for <meta-ti@yoctoproject.org>; Thu, 17 Oct 2013 14:29:51 -0700 (PDT)
Received: by mail-ea0-f170.google.com with SMTP id q10so1140626eaj.15
	for <meta-ti@yoctoproject.org>; Thu, 17 Oct 2013 14:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=n6iwieopYQ1E+hsy994sfi1qVXTKi5B1W9tNKMxF1Eo=;
	b=HT0F9K1JPmYbG71fdGMXd1E5N1jOg7m05RoD0hYlu/MqIDJM7MR5Uv6dEKLJ6snqV/
	TEs0duoFdCSF/nn832VnzDOwOzzzH+CQq1aSLrUgF/fjYz35SsBkg4PQ47KHIs4gFi++
	GpI8bo0YAygvSpMeNgEFtbQT2yRDgnrtS9eTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=n6iwieopYQ1E+hsy994sfi1qVXTKi5B1W9tNKMxF1Eo=;
	b=O70DEEsYEP24t43jTsFRZ2VjSe4orSw0icP1VvGtKTLl5WW1v6RQcQm90PFiK4PC18
	S8KhA7436RSbTBWSI2J3p3C5e/gU6i6siVHoq3HwbGPkySAOlAzYVinCGm8n3ULtjJz0
	o0u1UiitANJ+V8ueXCLJEatYGjbos2vDnbIcN2fJ+R7jYPCNkQDZLv/wYvrZU5vFLc3u
	bAAER2Wrh9B3m9tXeMufCOnq/XIzlwX94UmBiTQ7l0O2KeV0ytkDlWpLJfs+aBLX70pk
	wM8SWtr2TfxDJ8strKa5p04p3OGyvJ0rus5QwuyZ49Q2gDYEnQIya79M6TCU8xaPs0X5
	EaQA==
X-Gm-Message-State: ALoCoQlc8XOLdhWSBTPXnFv42zCG1nn4kGgJW/fKcqZG84SHAvkEw+pHm65coiDTahzF4+U5ibx+
MIME-Version: 1.0
X-Received: by 10.15.93.204 with SMTP id w52mr6524282eez.69.1382045389720;
	Thu, 17 Oct 2013 14:29:49 -0700 (PDT)
Received: by 10.223.131.3 with HTTP; Thu, 17 Oct 2013 14:29:49 -0700 (PDT)
Date: Thu, 17 Oct 2013 14:29:49 -0700
Message-ID: <CA+gsK-p49VYtzviOwgtzssxxXnAS4Eku0Y95bsFL5LvT+v=9Sw@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: meta-ti@yoctoproject.org
Subject: AM335x EVM and core-image-sato
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
X-List-Received-Date: Thu, 17 Oct 2013 21:29:54 -0000
Content-Type: multipart/alternative; boundary=089e01681486849ea904e8f6843d

--089e01681486849ea904e8f6843d
Content-Type: text/plain; charset=ISO-8859-1

I built a core-image-sato for the AM335x EVM. The image boots into the
command line. X does not work. There is no frame buffer device (/dev/fb0).

/lib/modules/3.12.0-rc3/kernel/dirvers/video/omap2/omapfb contains an
omapfb kernel module. However, "modprobing" it results in ERROR: Could not
insert 'omapfb': No such device.

I suppose I am missing something here but what?

Thanks,
Rudi

--089e01681486849ea904e8f6843d
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr">I built a core-image-sato for the AM335x EVM. The image boots into the command line. X does not work. There is no frame buffer device (/dev/fb0).<div dir="ltr"></div>
<div><br></div><div>/lib/modules/3.12.0-rc3/kernel/dirvers/video/omap2/omapfb contains an omapfb kernel module. However, &quot;modprobing&quot; it results in ERROR: Could not insert &#39;omapfb&#39;: No such device.</div>
<div><br></div><div>I suppose I am missing something here but what?</div><div><br></div><div>Thanks,</div><div>Rudi</div></div>

--089e01681486849ea904e8f6843d--
