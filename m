Return-Path: <sledz@dresearch-fe.de>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55A9DE01400
	for <meta-ti@yoctoproject.org>; Fri, 20 Apr 2012 00:20:52 -0700 (PDT)
Received: by bkcji17 with SMTP id ji17so10535680bkc.35
	for <meta-ti@yoctoproject.org>; Fri, 20 Apr 2012 00:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:x-enigmail-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=FuhPcfB4ycvRacboittzpo9cZhe7ITJJMYDXxT0SGaQ=;
	b=aW7vNbtgtDflARxYe9yErZrxsAjt4gqfXtMGf35jS9tMGM4bgw4ChmaeCakAeobM4W
	us2dlxGri3f+ikDutTP/DMlWUMkZyGUrZ/smoJfDDZiu0VZRn5TpO16Z2ZQcxKRiotyP
	ap7I1IdLud3uYbzu2KbXkFWpRV7pmN2g/hiviKYZ3em86bZNzE+l0EHV5p89HLfSqHEo
	wPU3DAq/4CzCWdxP9zK6Bf8wdillilFqowFTeRt825sRvW7pRRQ0i1A8Nzt2OJAtdw/1
	fXHgpP6wyQUOAbKE6+NOD6M4jBduHBWqrS3zjQ1m5u6fFeLQ1pB4NalHBzrc76nhDJd4
	8okA==
Received: by 10.205.121.138 with SMTP id gc10mr1680697bkc.23.1334906450835;
	Fri, 20 Apr 2012 00:20:50 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id hq5sm5247812bkc.8.2012.04.20.00.20.48
	(version=SSLv3 cipher=OTHER); Fri, 20 Apr 2012 00:20:49 -0700 (PDT)
Message-ID: <4F910E4F.9000800@dresearch-fe.de>
Date: Fri, 20 Apr 2012 09:20:47 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120328 Thunderbird/11.0.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
X-Enigmail-Version: 1.4
X-Gm-Message-State: ALoCoQnAjfZhTAAPutJae8BWenzSZdWaG+XID9s7LhNQ7JYL52cKxfGcKwLI2mPgOa/zsRByp+x8
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: meta-ti layer confusion
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Apr 2012 07:20:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Our company is working on a new TI DM814x based hardware currently.

That's a really hard job, because the TI linux support is not really "optimal". But that's not the primary cause for my message.

[1] lists two TI BSP layers [2],[3] each one claiming to be "The official OpenEmbedded/Yocto BSP layer for Texas Instruments platforms.".

A look into them shows that they are not identically. At the moment they differ in two commits ([3] is ahead of [2]). In the last days these differences where much bigger.

So what is the intention for these two "offical" layers?

Which one should we use? And why?

BTW: Is anyone else out there working on a TI DM814x/DM816x hardware?

Regards,
Steffen

[1] <http://www.openembedded.org/wiki/LayerIndex>
[2] <http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/>
[3] <https://github.com/Angstrom-distribution/meta-ti>

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

